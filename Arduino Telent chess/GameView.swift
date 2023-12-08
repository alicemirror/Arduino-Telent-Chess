//
//  GameUIView.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 29/11/23.
//

import SwiftUI
import CoreData

// The full gameboard view. Over the gameboard, the button pieces
// should be ckickable to set the position.
struct GameView: View {
    
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
                // Page title
                TitleView(title: "Play Game")

                // Get the screen geometry to calculate the single square size and the 8x8
                // chessboard size
                GeometryReader { geometry in
                    // We use the 'spacingDesired' in the grid
                    // to show the boardgame tiles.
                    LazyHGrid(rows: rowsSquares, spacing: spacingGameBoardSquares, pinnedViews: [], content: {
                        ForEach(0 ..< 64) { boardIndex in
                            // Draw the board square
                            BoardSquare(squareBoardSize: squareSize)
                        } // Loop on all the boards
                    }) // LazyHGrid
                    .position(CGPoint(x: geometry.size.width / 2,
                                      y: geometry.size.height / 2) )
                    .onTapGesture {
                        print("Touched")
                    } // onTapGesture

                    // Position the pieces (game start)
                    LazyHGrid(rows: rowsPieces, spacing: spacingGameBoardSquares, pinnedViews: [], content: {
                        ForEach(0 ..< 64) { boardIndex in
                            // Draw the piece image - if any - over the square
                            GamePiecePosition(pieceBoardSize: pieceSize, piece:         gamePiecesPosition[boardIndex] )
                        } // Loop on all the boards
                    }) // LazyHGrid
                    .position(CGPoint(x: geometry.size.width / 2,
                                      y: geometry.size.height / 2) )
                } // GeometryReader

            } // ZStack
        } // Navigation view
    } // View
} // Game content view

#Preview {
    GameView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
