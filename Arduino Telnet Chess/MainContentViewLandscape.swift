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
                    TitleViewLandscape(title: sTitle)
                    // Option buttons
                    GeometryReader {
                        geometry in
                        VStack {
                            CustomMenuButton(title: sPlay, action: {
                                selectedDestination = .playView
                            } )
                            .padding(curstomMenutPadding)
                            CustomMenuButton(title: sGames, action: {
                                selectedDestination = .gamesView
                            } )
                            .padding(curstomMenutPadding)
                            CustomMenuButton(title: sSetup, action: {
                                selectedDestination = .setupView
                            } )
                            .padding(curstomMenutPadding)
                            CustomMenuButton(title: sHelp, action: {
                                selectedDestination = .helpView
                            } )
                            .padding(curstomMenutPadding)
                            CustomMenuButton(title: sAbout, action: {
                                selectedDestination = .aboutView
                            } )
                            .padding(curstomMenutPadding)
                        } // VStack
                        .position(x: geometry.size.width / 8, y: geometry.size.height / 2.8)
                    } // Geometry

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
        .edgesIgnoringSafeArea(.all) // Covers the full screen
    } // Body view
    
    
    @ViewBuilder
    private func CustomDestinationOptionsView(for destination: CustomDestinationOptions) -> some View {
        switch destination {
        case .playView:
            PortraitPlayView()
        case .gamesView:
            PortraitGamesView()
        case .setupView:
            PortraitSetupView()
        case .helpView:
            PortraitHelpView()
        case .aboutView:
            PortraitAboutView()
        } // case
    } // DestinationOptionsView
    
} // Main content view


#Preview {
    MainContentViewLandscape().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
