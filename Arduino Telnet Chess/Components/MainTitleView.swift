//
//  TitlesView.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 30/11/23.
//

import SwiftUI

// Main page view title
struct MainTitleView: View {
    // Title text string
    let title: String
    let subTitle: String

    var body: some View {
        // Page title background
        GeometryReader {
            geometry in
            Rectangle()
                .position(x: geometry.size.width / 2, y: (geometry.size.height / 18) - 90)
                .frame(height: 60)
                .foregroundColor(appColors["foreground"])
            Text(title)
                .position(x: geometry.size.width / 2, y: (geometry.size.height / 18) - 90)
                .font(.custom("San Francisco (SF Pro Text)", size: 48))
                .fontWeight(.bold)
                .foregroundColor(appColors["titleText"])
                .lineSpacing(10)
                .truncationMode(.tail)
                .kerning(1.5)
                .opacity(1)
            Text(subTitle)
                .position(x: geometry.size.width / 2, y: (geometry.size.height / 22) - 20)
                .font(.custom("San Francisco (SF Pro Text)", size: 30))
                .fontWeight(.bold)
                .foregroundColor(appColors["subTitleText"])
                .lineSpacing(10)
                .truncationMode(.tail)
                .kerning(1.5)
                .opacity(1)
        } // geometry
    } // body
} // Main title view
