//
//  AboutView.swift
//  Arduino Telnet Chess
//
//  Created by Enrico Miglino on 6/2/24.
//  Copyright © 2024 Enrico Miglino. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        if UIDevice.current.orientation.isPortrait {
            // Vertical Layout
            PortraitAboutView()
        } else {
            LandscapeAboutView()
        }
    }
}

//#Preview {
//    AboutView()
//}
