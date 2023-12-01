//
//  SetupView.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 29/11/23.
//

import SwiftUI
import CoreData

struct SetupView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    // BODY OF THE GAME VIEW
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color.teal
                    .ignoresSafeArea()
                // --------------------- Page title
                TitleView(title: "Setup")

                // --------------------- Game board

                
            } // ZStack
        } // Navigation view
    } // View
} // Main content view

#Preview {
    SetupView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
