//
//  Buttons.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 19/11/23.
//

import SwiftUI

// Generic button used in the toolbar
struct ToolbarButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(appColors["toolbarMenu"])
                .font(.headline)
        }
    }
}

// Generic button used in the custom landscape menu
struct CustomMenuButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(appColors["landscapeMenu"])
                .font(.headline)
        }
    }
}

