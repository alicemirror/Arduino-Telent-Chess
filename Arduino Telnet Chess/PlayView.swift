//
//  PlayView.swift
//  Arduino Telnet Chess
//
//  Created by Enrico Miglino on 6/2/24.
//  Copyright © 2024 Enrico Miglino. All rights reserved.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        if UIDevice.current.orientation.isPortrait {
            // Vertical Layout
            PortraitPlayView()
//            return VStack {
//                Text("Vertical Layout for View 1")
//                // Add more vertical content here
//            }
//            .padding()
        } else {
            LandscapePlayView()
            // Horizontal Layout
//            return HStack {
//                Text("Horizontal Layout for View 1")
//                // Add more horizontal content here
//            }
//            .padding()
        }
    }
}

#Preview {
    PlayView()
}
