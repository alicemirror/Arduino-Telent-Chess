//
//  TitlesView.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 30/11/23.
//

import SwiftUI

// Show home page logo
struct ShowLogoHome: View {
    var body: some View {
        // Page title background
        GeometryReader {
            geometry in
            Image("HomeScreenImage")
                .resizable()
                .frame(width: 400, height: 400)
                .position(x: geometry.size.width / 2, y: (geometry.size.height / 2.4) - 30)
        } // Title background geometry
    } // body
} // ShowLogo

// Show The Shed logo
struct ShowLogoShed: View {
    var body: some View {
        // Page title background
        GeometryReader {
            geometry in
            Image("TheShed")
                .resizable()
                .frame(width: 160, height: 64)
                .position(x: geometry.size.width / 2, y: (geometry.size.height / 1.3) - 10)
        } // Title background geometry
    } // body
} // ShowLogo

// Show Element14 logo
struct ShowLogoElement14: View {
    var body: some View {
        // Page title background
        GeometryReader {
            geometry in
            Image("element14")
                .resizable()
                .frame(width: 176, height: 28)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 1.18)
        } // Title background geometry
    } // body
} // ShowLogo
