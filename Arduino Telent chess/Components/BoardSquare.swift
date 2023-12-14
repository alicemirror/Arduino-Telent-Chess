//
//  ChessBoardSquare.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 4/12/23.
//

import SwiftUI

// Design a generic square of the chessboard
// The squareSize depends on the screen geometry calculate in the
// chessboard view.
// Color is provided by the caller, defined by two alternate.
struct BoardSquare: View {
    var squareBoardSize: CGFloat

    var body: some View {
        RoundedRectangle(cornerRadius: tilesCornerRadius)
          .frame(width: squareBoardSize, height: squareBoardSize, alignment: .center)
          .foregroundColor(boardColors[isLightSquare()])
        } // body view
} // BoardSquaree
