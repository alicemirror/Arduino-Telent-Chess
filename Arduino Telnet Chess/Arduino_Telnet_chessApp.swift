//
//  Arduino_Telent_chessApp.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 18/11/23.
//

import SwiftUI

@main
struct Arduino_Telnet_chessApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CustomUIKitView(portraitLayout: AnyView(MainContentViewPortrait()),
                    landscapeLayout: AnyView(MainContentViewLandscape()))
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
