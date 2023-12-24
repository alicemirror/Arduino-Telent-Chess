//
//  MainContentViewLandscape.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 18/11/23.
//

import SwiftUI
import CoreData

// Main view components landscape layout
struct MainContentViewLandscape: View {
    // Manage the DestinationOptions for the navigation stack
    @State private var navigationSelection: DestinationOptions?

    var body: some View {
        // Navigation stack to manage toolbar navigation
        NavigationStack {
            NavigationView {
                // Z stack: components layers.
                ZStack {
                    ShowLogoShedLandscape()
                    ShowLogoElement14Landscape()
                    // Page title
                    TitleViewLandscape(title: "Telnet Chess")
                } // Navigation view
                .background(
                    Image("Credits") // Replace with your image name
                        .resizable() // Make the image resizable
                        .aspectRatio(contentMode: .fit) // Fit the background
                        .edgesIgnoringSafeArea(.all) // Cover the entire screen
                )
            } // View
            } // Navigation Stack
        } // Body view
    @ViewBuilder
    private func DestinationoptionsView(for destination: DestinationOptions) -> some View {
        switch destination {
        case .PlayView:
            PlayView()
        case .GamesView:
            GamesView()
        case .SetupView:
            SetupView()
        case .HelpView:
            HelpView()
        case .AboutView:
            AboutView()
        } // case
    } // View
} // Main content view


#Preview {
    MainContentViewLandscape().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
