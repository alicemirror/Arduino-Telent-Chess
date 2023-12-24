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
enum DestinationOptions: Hashable {
    case PlayView
    case GamesView
    case SetupView
    case HelpView
    case AboutView
} // DestinationOptions

// ---------------------
