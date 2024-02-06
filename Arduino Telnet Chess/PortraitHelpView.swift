//
//  HelpView.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 29/11/23.
//

import SwiftUI
import CoreData

struct PortraitHelpView: View {
    
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
                appColors["background"]
                    .ignoresSafeArea()
                GeometryReader {
                    geometry in
                    ScrollableTextArea(longText: textHelp)                    .position(x: geometry.size.width / 2, y: (geometry.size.height / 1.6) )
                }
                TitleViewPortrait(title: "Help")
            } // ZStack
        } // Navigation view
    } // View
} // Main content view

#Preview {
    PortraitHelpView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
