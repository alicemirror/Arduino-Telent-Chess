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
    @State private var navigationSelection: DestinationOptions?

    var body: some View {
        // Navigation stack to manage toolbar navigation
        NavigationStack {
            NavigationView {
                // Z stack: components layers.
                ZStack {
                    // Hidden Navigation Links
                    ForEach([
                        DestinationOptions.PlayView,
                        DestinationOptions.GamesView,
                        DestinationOptions.SetupView,
                        DestinationOptions.HelpView,
                        DestinationOptions.AboutView
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
                    MainTitleView(title: "Telnet Chess",
                                  subTitle: "Arduino UNO R4 Edition")
                } // Navigation view
            } // View
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarButton(title: "Play", action: {
                        navigationSelection = .PlayView
                    } )
                } // ToolbarItem
                    
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarButton(title: "Games", action: {
                        navigationSelection = .GamesView
                    } )
                } // ToolbarItem
                    
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarButton(title: "Setup", action: {
                        navigationSelection = .SetupView
                    } )
                } // ToolbarItem
                
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarButton(title: "Help", action: {
                        navigationSelection = .HelpView
                    } )
                } // ToolbarItem
                
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarButton(title: "About", action: {
                        navigationSelection = .AboutView
                    } )
                } // ToolbarItem
                
                } // toolbar
            } // Navigation Stack
        } // Body view
    
    @ViewBuilder
    private func ToolbarDestinationOptionsView(for destination: DestinationOptions) -> some View {
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
    MainContentViewPortrait().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
