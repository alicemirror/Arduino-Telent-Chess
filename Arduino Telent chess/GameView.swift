//
//  GameUIView.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 29/11/23.
//

import SwiftUI
import CoreData

struct GameView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)

    private var items: FetchedResults<Item>

    // 2D array showing the state of the board.
    // Uppercase are white, lowercase are black.
    let board: [[String]] = [
        ["R", "N", "B", "Q", "K", "B", "N", "R"],
        ["P", "P", "P", "P", "P", "P", "P", "P"],
        ["", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", ""],
        ["r", "n", "b", "q", "k", "b", "n", "r"],
        ["p", "p", "p", "p", "p", "p", "p", "p"]
    ]

    // BODY OF THE GAME VIEW
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color.teal
                    .ignoresSafeArea()
                // Page title
                TitleView(title: "Play Game")

                // Cheboard squares positioning
                VStack(spacing: 0) {
                    ForEach(0..<8, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<8, id: \.self) { column in
                                ChessSquareView(piece: board[row][column], isLightSquare: (row + column) % 2 == 0)
                            } // column
                        } // HStack
                    } // row
                    .border(Color.black, width: 2)
                } // VStack
            } // ZStack
        } // Navigation view
    } // View
} // Game content view

struct ChessSquareView: View {
    var piece: String
    var isLightSquare: Bool

    var body: some View {
        ZStack {
            Rectangle()
                .fill(isLightSquare ? Color.white : Color.gray)
            Image(systemName: iconName(for: piece))
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
        }
    }

    // Function to get the correct icon name based on the piece
    func iconName(for piece: String) -> String {
        switch piece {
        case "R": return "Rook_White"    // replace with your image names
        case "N": return "Knight_White"
        case "B": return "Bishop_White"
        // ... handle other pieces
        default: return ""
        }
    }
}

#Preview {
    GameView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
