//
//  GamePiecesPosition.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 4/12/23.
//

import SwiftUI

// Design a generic square of the chessboard
// The squareSize depends on the screen geometry calculate in the
// chessboard view.
// Color is provided by the caller, defined by two alternate.
struct GamePiecePosition: View {
    var pieceBoardSize: CGFloat
    var piece: String

    var body: some View {
        Image(iconName(for: piece))
            .resizable()
            .scaledToFit()
            .frame(width: pieceBoardSize, height: pieceBoardSize)
        } // body view
} // BoardSquaree
