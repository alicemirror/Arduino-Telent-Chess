//
//  Globals.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 3/12/23.
//

import Foundation
import SwiftUI
import CoreData

// Array defining the two colors to alternate in the
// chessboard design.
// Colors arew in couples (white, black sides) and the indesx
// should point to the even first of every couple (0, 2, 4, etc.)
let boardColors = [
    Color.white, Color.purple,
    Color.white, Color.brown,
    Color.red, Color.white,
    Color.yellow, Color.brown
]

// 2D array showing the initial state of the board pieces.
// Uppercase are white, lowercase are black.
let gamePiecesPosition: [String] = [
    "r", "p", "", "", "", "", "P", "R",
    "n", "p", "", "", "", "", "P", "N",
    "b", "p", "", "", "", "", "P", "B",
    "q", "p", "", "", "", "", "P", "Q",
    "k", "p", "", "", "", "", "P", "K",
    "b", "p", "", "", "", "", "P", "B",
    "n", "p", "", "", "", "", "P", "N",
    "r", "p", "", "", "", "", "P", "R"
]

// Decide alternatively the color of every square tile of the board.
var isWhite: Bool = true

// Get the index of the desired couple of colors array,
// chose two by two. The first color is for white tiles
// while the second is for the black tiles.
var baseColorArray: Int = 6

// The current position in the 8x8 array
var currentPosition: Int = 0

// Spacing between squares, constant value according to
// the desired design. This value maybe 0 = no spacing
var spacingGameBoardSquares: CGFloat = 1

// Spacing between squares, constant value according to
// the desired design. This value maybe 0 = no spacing
let spacingPieces: CGFloat = 0.5

// Size of the smaller side of the screen
let size = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)

// Single square size based on the smaller side of the screen
let squareSize = Double(size / 8.5)

// Single piece size based on the smaller side of the screen
let pieceSize = Double(size / 8.7)

// These are our grid items we'll use in the 'LazyHGrid' to draw the
// board squares.
// Every item of the array represent one of eight horizontal
// squares.
let rowsSquares = [
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center)
]


// These are our grid items we'll use in the 'LazyHGrid' to draw the
// board pieces.
// Every item of the array represent one of eight horizontal
// squares.
let rowsPieces = [
    GridItem(.fixed(squareSize), spacing: spacingPieces, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingPieces, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingPieces, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingPieces, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingPieces, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingPieces, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingPieces, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingPieces, alignment: .center)
]
