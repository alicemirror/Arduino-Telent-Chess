//
//  MainContentViewPortrait.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 18/11/23.
//

import SwiftUI
import CoreData

// Portrait main view components
struct MainContentViewPortrait: View {
    // Manage the DestinationOptions for the navigation stack
    @State private var navigationSelection: ToolbarDestinationOptions?

    var body: some View {
        // Navigation stack to manage toolbar navigation
        NavigationStack {
            NavigationView {
                // Z stack: components layers.
                ZStack {
                    // Hidden Navigation Links
                    ForEach([
                        ToolbarDestinationOptions.toolbarPlayView,
                        ToolbarDestinationOptions.toolbarGamesView,
                        ToolbarDestinationOptions.toolbarSetupView,
                        ToolbarDestinationOptions.toolbarHelpView,
                        ToolbarDestinationOptions.toolbarAboutView
                    ], id: \.self) {
                        destination in
                        NavigationLink("", tag: destination,
                                       selection: $navigationSelection) {
                            ToolbarDestinationOptionsView(for: destination)
                        } // selection: $navigationSelection)
                    } // id: \.self)
                    // Background color
                    appColors["background"]
                        .ignoresSafeArea()
                    ShowLogoShedPortrait()
                    ShowLogoHome()
                    ShowLogoElement14Portrait()
                    VersionBuild()
                    // Page title
                    MainTitleView(title: sTitle,
                                  subTitle: sSubTitle)
                } // Navigation view
            } // View
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarButton(title: sPlay, action: {
                        navigationSelection = .toolbarPlayView
                    } )
                } // ToolbarItem
                    
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarButton(title: sGames, action: {
                        navigationSelection = .toolbarGamesView
                    } )
                } // ToolbarItem
                    
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarButton(title: sSetup, action: {
                        navigationSelection = .toolbarSetupView
                    } )
                } // ToolbarItem
                
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarButton(title: sHelp, action: {
                        navigationSelection = .toolbarHelpView
                    } )
                } // ToolbarItem
                
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarButton(title: sAbout, action: {
                        navigationSelection = .toolbarAboutView
                    } )
                } // ToolbarItem
                
                } // toolbar
            } // Navigation Stack
        } // Body view
    
    @ViewBuilder
    private func ToolbarDestinationOptionsView(for destination: ToolbarDestinationOptions) -> some View {
        switch destination {
        case .toolbarPlayView:
            PlayView()
        case .toolbarGamesView:
            PortraitGamesView()
        case .toolbarSetupView:
            PortraitSetupView()
        case .toolbarHelpView:
            PortraitHelpView()
        case .toolbarAboutView:
            PortraitAboutView()
        } // case
    } // View
} // Main content view


#Preview {
    MainContentViewPortrait().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
