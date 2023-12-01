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
                .foregroundColor(.white)
                .font(.headline)
        }
    }
}

