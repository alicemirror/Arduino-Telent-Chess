//
//  MainContentViewLandscape.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 18/11/23.
//

import SwiftUI
import CoreData

// Destination options enum associated to every custom button
enum CustomDestinationOptions {
    case playView, gamesView, setupView, helpView, aboutView
}

// Main view components landscape layout
struct MainContentViewLandscape: View {
    @State private var selectedDestination: CustomDestinationOptions?
    
    var body: some View {
        // Navigation stack to manage custom buttons navigation
        NavigationStack {
            NavigationView {
                // Z stack: components layers.
                ZStack {
                    // Graphic layout
                    ShowLogoShedLandscape()
                    ShowLogoElement14Landscape()
                    // Page title
                    TitleViewLandscape(title: "Telnet Chess")
                    // Option buttons
                    VStack {
                        CustomMenuButton(title: "Play", action: {
                            selectedDestination = .playView
                        } )
                        CustomMenuButton(title: "Games", action: {
                            selectedDestination = .gamesView
                        } )
                        CustomMenuButton(title: "Setup", action: {
                            selectedDestination = .setupView
                        } )
                        CustomMenuButton(title: "Help", action: {
                            selectedDestination = .helpView
                        } )
                        CustomMenuButton(title: "About", action: {
                            selectedDestination = .aboutView
                        } )
                    } // VStack
                    
                    // Navigate to the selected view
                    if let destination = selectedDestination {
                        CustomDestinationOptionsView(for: destination)
                    } // Selected view navigation
                } // ZStack
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Image("Credits")
                        .resizable() // Make the image resizable
                        .aspectRatio(contentMode: .fill) // Stretch to fill the view
                        .edgesIgnoringSafeArea(.all) // Covers the full screen
                )
            } // Navigation View
        } // Navigation Stack
    } // Body view
    
    
    @ViewBuilder
    private func CustomDestinationOptionsView(for destination: CustomDestinationOptions) -> some View {
        switch destination {
        case .playView:
            PlayView()
        case .gamesView:
            GamesView()
        case .setupView:
            SetupView()
        case .helpView:
            HelpView()
        case .aboutView:
            AboutView()
        } // case
    } // DestinationOptionsView
    
} // Main content view


#Preview {
    MainContentViewLandscape().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
