//
//  SetupView.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 29/11/23.
//

import SwiftUI
import CoreData

struct GamesView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    // BODY OF THE GAMES VIEW
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                appColors["background"]
                    .ignoresSafeArea()
                // --------------------- Page title
                TitleView(title: "Games Archive")
                
            } // ZStack
        } // Navigation view
    } // View
} // Main content view

#Preview {
    GamesView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
