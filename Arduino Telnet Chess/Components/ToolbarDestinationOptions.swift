//
//  ToolbarDestinationOptions.swift
//  Arduino Telnet Chess
//
//  Created by Enrico Miglino on 24/12/23.
//  Copyright © 2023 Enrico Miglino. All rights reserved.
//

import SwiftUI

// Enumerates the secondary level options views
// as hashable (can produce a hash integer)
enum ToolbarDestinationOptions: Hashable {
    case toolbarPlayView
    case toolbarGamesView
    case toolbarSetupView
    case toolbarHelpView
    case toolbarAboutView
} // DestinationOptions


// Destination options enum associated to every custom button
enum CustomDestinationOptions {
    case playView, gamesView, setupView, helpView, aboutView
}
