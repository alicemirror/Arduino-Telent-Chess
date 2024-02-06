//
//  TitlesView.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 30/11/23.
//

import SwiftUI

// Generic page view title portrait
struct TitleViewPortrait: View {
    // Title text string
    let title: String

    var body: some View {
        // Page title background
        GeometryReader {
            geometry in
            Rectangle()
                .position(x: geometry.size.width / 2, y: geometry.size.height / 18)
                .frame(height: 60)
                .foregroundColor(appColors["foreground"])
        } // Title background geometry
        // Page title
        GeometryReader {
            geometry in
            Text(title)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 18)
                .font(.custom("San Francisco (SF Pro Text)", size: 48))
                .fontWeight(.bold)
                .foregroundColor(appColors["titleText"])
                .lineSpacing(10)
                .truncationMode(.tail)
                .kerning(1.5)
                .opacity(1)
        } // Title geometry
    } // body
} // View

// Generic page view title landscape
struct TitleViewLandscape: View {
    // Title text string
    let title: String

    var body: some View {
        // Page title
        GeometryReader {
            geometry in
            Text(title)
                .position(x: geometry.size.width / 6.5, y: (geometry.size.height / 18) - 5)
                .font(.custom("San Francisco (SF Pro Text)", size: 32))
                .fontWeight(.bold)
                .foregroundColor(appColors["titleText"])
                .lineSpacing(2)
                .truncationMode(.tail)
                .kerning(1.5)
                .opacity(1)
        } // Title geometry
    } // body
} // View

