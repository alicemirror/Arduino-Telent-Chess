//
//  PlayView.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 29/11/23.
//

import SwiftUI
import CoreData

// The full gameboard view. Over the gameboard, the button pieces
// should be ckickable to set the position.
struct LandscapePlayView: View {
    
    @State private var selectedTiles: Set<Int> = []
    
    // BODY OF THE GAME VIEW
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                appColors["background"]
                    .ignoresSafeArea()
                // Page title
                TitleViewPortrait(title: sPlayTitle)

                // Get the screen geometry to calculate the single square size and the 8x8
                // chessboard size
                GeometryReader { geometry in
                    LazyHGrid(rows: rowsSquares, spacing: spacingGameBoardSquares) {
                        ForEach(0 ..< 64, id: \.self) { boardIndex in
                            // Draw the board square
                            BoardSquare(squareBoardSize: squareSize)
                        } // Loop on all the squares
                    } // LazyHGrid
                    .position(CGPoint(x: geometry.size.width / 2,
                                      y: geometry.size.height / 2) )

                    // Position the pieces (game start)
                    LazyHGrid(rows: rowsPieces, spacing: spacingGameBoardSquares, pinnedViews: [], content: {
                        ForEach(0 ..< 64) { boardIndex in
                            // Draw the piece image - if any - over the square
                            GamePiecePosition(pieceBoardSize: pieceSize, piece:         gamePiecesPosition[boardIndex] )
                        } // Loop on all the boards
                    }) // LazyHGrid
                    .position(CGPoint(x: geometry.size.width / 2,
                                      y: geometry.size.height / 2) )

                    // Draw the touch sensitive areas corresponding to the
                    // squares
                    LazyHGrid(rows: rowsTouch, spacing: spacingGameBoardSquares) {
                        ForEach(0 ..< 64, id: \.self) { boardIndex in
                            // Draw the board sesitive areas
                            BoardSquareTouch(isSelected: selectedTiles.contains(boardIndex),
                                             squareBoardSize: squareSize
                                            )
                                .onTapGesture {
                                    if selectedTiles.contains(boardIndex) {
                                        selectedTiles.remove(boardIndex)
                                    } // selectedTiles remove
                                    else {
                                        selectedTiles.insert(boardIndex)
                                    } // selectedTiles insert
                                } // onTapGesture
                        } // Loop on all the squares
                    } // LazyHGrid
                    .position(CGPoint(x: geometry.size.width / 2,
                                      y: geometry.size.height / 2) )
                } // GeometryReader
            } // ZStack
        } // Navigation view
    } // View
} // Game content view

#Preview {
    PortraitPlayView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
