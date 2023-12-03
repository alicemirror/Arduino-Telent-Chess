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

                GeometryReader { geometry in
                    let size = min(geometry.size.width, geometry.size.height)
                    let squareSize = Double(size / 10)
                    
                    ScrollView {  // For debugging purpose
                        // Cheboard squares positioning
                        VStack(spacing: 0) {
                            ForEach(0..<8, id: \.self) { row in
                                HStack(spacing: 0) {
                                    ForEach(0..<8, id: \.self) { column in
                                        ChessSquareView(piece: board[row][column], 
                                                        isLightSquare: (row + column) % 2 == 0,
                                                        frameSize: squareSize)
                                            .frame(width: squareSize, height: squareSize)
                                    } // column
                                } // HStack
                            } // row
                            .frame(width: size, height: size, alignment: .center)
//                            .border(Color.black, width: 2)
                        } // VStack
                    }
                } // Geometry Reader
            } // ZStack
        } // Navigation view
    } // View
} // Game content view

// Draw the 8x8 chess square
struct ChessSquareView: View {
    var piece: String
    var isLightSquare: Bool
    var frameSize: CGFloat

    var body: some View {
        ZStack {
            Rectangle()
                .fill(isLightSquare ? Color.white : Color.gray)
//            Image(systemName: iconName(for: piece))
//                .resizable()
//                .scaledToFit()
//                .frame(width: frameSize, height: frameSize)
        } // ZStack
    } // body

    // Function to get the correct icon name based on the piece
    func iconName(for piece: String) -> String {
        switch piece {
        case "R": return "Rook_White"
        case "N": return "Knight_White"
        case "B": return "Bishop_White"
        case "Q": return "Queen_White"
        case "K": return "King_White"
        case "P": return "Pawn_White"
        case "r": return "Rook_Black"
        case "n": return "Knight_Black"
        case "b": return "Bishop_Black"
        case "q": return "Queen_Black"
        case "k": return "King_Black"
        case "p": return "Pawn_Black"
        // ... handle other pieces
        default: return ""
        } // switch piece
    } // funct iconName
} // ChessSquareView

#Preview {
    GameView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
