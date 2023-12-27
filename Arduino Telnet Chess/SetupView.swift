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
    
    // BODY OF THE SETUP VIEW
    var body: some View {
        ZStack {
            // Background color
            appColors["background"]
                .ignoresSafeArea()
            // Page Title
            TitleViewPortrait(title: sSetup)
                ScrollView {
                    VStack {
                        SetupTitleView(section: sColortTheme)
                        SelectChessboardThemeView()
                    } // VStack
                } // Scrollview
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, 100)
        } // ZStack
    } // body
} // Main content view

#Preview {
    SetupView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
