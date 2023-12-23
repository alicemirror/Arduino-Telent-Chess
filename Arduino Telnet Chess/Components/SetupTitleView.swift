//
//  TitlesView.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 30/11/23.
//

import SwiftUI

// Generic page view title
struct SetupTitleView: View {
    // Title text string
    let section: String

    var body: some View {
        // Setup component title
//        GeometryReader {
//            geometry in
            Text(section)
                .font(.custom("San Francisco (SF Pro Text)", size: 32))
                .fontWeight(.bold)
                .foregroundColor(appColors["sectionText"])
                .lineSpacing(10)
                .truncationMode(.tail)
                .kerning(1.5)
                .opacity(1)
//        } // Title geometry
    } // Body
} // View
