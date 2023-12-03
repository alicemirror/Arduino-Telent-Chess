//
//  GameUIView.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 29/11/23.
//

import SwiftUI
import CoreData

// Design a generic square of the chessboard
// The squareSize depends on the screen geometry calculate in the
// chessboard view.
// Color is provided by the caller, defined by two alternate.
struct BoardSquare: View {
    var squareBoardSize: CGFloat

    var body: some View {
        RoundedRectangle(cornerRadius: 5)
          .frame(width: squareBoardSize, height: squareBoardSize, alignment: .center)
          .foregroundColor(boardColors[isLightSquare()])
        } // body view
} // BoardSquaree

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
                    // Size of the smaller side of the screen
                    let size = min(geometry.size.width, geometry.size.height)
                    // Single square size based on the smaller side of the screen
                    let squareSize = Double(size / 8.5)
                    
                    // Spacing between squares, constant value according to
                    // the desired design. This value maybe 0 = no spacing
                    let spacingDesired: CGFloat = 1

                    // These are our grid items we'll use in the 'LazyHGrid'
                    // Every item of the array represent one of eight horizontal
                    // squares.
                    let rows = [
                        GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center),
                        GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center),
                        GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center),
                        GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center),
                        GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center),
                        GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center),
                        GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center),
                        GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center)
                    ]
                
                    // We then use the 'spacingDesired' in the grid
                    LazyHGrid(rows: rows, spacing: spacingDesired, pinnedViews: [], content: {
                        ForEach(0 ..< 64) { boardIndex in
                            BoardSquare(squareBoardSize: squareSize)
                        } // Loop on all the boards
                    }) // LazyHGrid
                    .position(CGPoint(x: geometry.size.width / 2,
                                      y: geometry.size.height / 2) )
                } // GeometryReader
            } // ZStack
        } // Navigation view
    } // View
} // Game content view

//// Draw the 8x8 chess square
//struct ChessSquareView: View {
//    var piece: String
//    var isLightSquare: Bool
//    var frameSize: CGFloat
//
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(isLightSquare ? Color.white : Color.gray)
////            Image(systemName: iconName(for: piece))
////                .resizable()
////                .scaledToFit()
////                .frame(width: frameSize, height: frameSize)
//        } // ZStack
//    } // body
//
//} // ChessSquareView

#Preview {
    GameView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
