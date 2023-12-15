//
//  MainContentView.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 18/11/23.
//

import SwiftUI
import CoreData

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
// Main view components
struct MainContentView: View {
    // Manage the DestinationOptions for the navigation stack
    @State private var navigationSelection: DestinationOptions?

    // ---------------------
    // MAIN VIEW BODY
    // ---------------------
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
                            DestinationoptionsView(for: destination)
                        } // selection: $navigationSelection)
                    } // id: \.self)
                    // Background color
                    appColors["background"]
                        .ignoresSafeArea()
                    // Home screen image
                    Image("HomeScreenImage")
                        .resizable()
                        .frame(width: 400, height: 400)
                    
                    // Application version
                    VersionBuild()
                    
                    // Page title
                    TitleView(title: "Arduino Chess")
                } // Navigation view
            } // View
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        navigationSelection = .PlayView
                    } ) {
                        Text("Play")
                            .foregroundColor(appColors["foreground"])
                            .font(.headline)
                    }
                } // ToolbarItem
                    
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        navigationSelection = .GamesView
                    } ) {
                        Text("Games")
                            .foregroundColor(appColors["foreground"])
                            .font(.headline)
                    }
                } // ToolbarItem
                    
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        navigationSelection = .SetupView
                    } ) {
                        Text("Setup")
                            .foregroundColor(appColors["foreground"])
                            .font(.headline)
                    }
                } // ToolbarItem
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        navigationSelection = .HelpView
                    } ) {
                        Text("Help")
                            .foregroundColor(appColors["foreground"])
                            .font(.headline)
                    }
                } // ToolbarItem
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        navigationSelection = .AboutView
                    } ) {
                        Text("About")
                            .foregroundColor(appColors["foreground"])
                            .font(.headline)
                    }
                } // ToolbarItem
                
                } // toolbar
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


//#Preview {
//    MainContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//}
