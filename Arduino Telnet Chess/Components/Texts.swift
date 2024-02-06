//
//  Texts.swift
//  Arduino Telnet Chess
//
//  Created by Enrico Miglino on 9/1/24.
//  Copyright © 2024 Enrico Miglino. All rights reserved.
//

import SwiftUI

let textAbout: String = """
Arduino UNO R4 Telnet chess for iOS
The Shed magazine edition.
"""

let textHelp: String = """
Quick help for Telnet Chess.
This application works with the
Arduino UNO R4 Telnet chess, and
it is part of the Arduino Telnet
Chess developed for The Shed Mag.
To play you should connect the application
to the same WiFi access point to which
the Arduino UNO R4 is connected.
To work properly, the application
connect automatically the Arduino UNO
R4 board. The Arduino board shoould have
installed the Arduino Telnet Chess
'mobile' option. The sketch is available
as Open Source on GitHub.
"""

struct ScrollableTextArea: View {
    // Multiline text string
    let longText: String

    var body: some View {
        ScrollView {
            Text(longText)
                .font(.custom("San Francisco (SF Pro Text)", size: 16))
                .fontWeight(.bold)
                .foregroundColor(appColors["scrollText"])
                .lineSpacing(10)
                .truncationMode(.tail)
                .kerning(1.5)
                .opacity(1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Set frame size
    }
}
