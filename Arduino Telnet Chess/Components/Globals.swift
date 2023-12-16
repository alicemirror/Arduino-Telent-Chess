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
    Color.white, Color.indigo,
    Color.white, Color.brown,
    Color.white, Color.red,
    Color.yellow, Color.brown,
    Color.white, Color.black,
    Color.white, Color.teal
]

// Board theme dictionary. The associated number is
// the first value of the pair of colors defined in
// the boardColors array.
// This dictionary is used to represent the theme
// with a string.
let boardThemes: [String: Int] = [
    "white_indigo": 0,
    "white_brown": 2,
    "red_white": 4,
    "yellow_brown": 6,
    "white_black": 8,
    "white_teal": 10
    ]

// transparency values for the two states of the chessboard
// position when it is touched or untouched.
// Note that if the untouched opacity is set to full zero
// it has no effect.
let transparencyTouch: [String: CGFloat] = [
    "touched": 0.5,
    "untouched": 0.01
    ]

// Appplication colors dictionary
let appColors: [String: Color] = [
        "background": .teal,
        "foreground": .white,
        "titleText": .teal,
        "subTitleText": .white,
        "normalText": .white,
        "stroke": .white,
        "selected": .purple
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

// Chessboard tiles corner radius
let tilesCornerRadius: CGFloat = 5

// Width of the stroke around the chessboard cells
let tilesStrokeWidth: CGFloat = 4

// Grid items we'll use in the 'LazyHGrid' to draw the
// board squares.
// Every item of the array represent one column of eight vertical
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

// Grid items we'll use in the 'LazyHGrid' to draw the
// board pieces.
// Every item of the array represent one column of eight vertical
// placeholders.
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

// Grid items we'll use in the 'LazyHGrid' to identify the touch
// areas corresponding to the squares.
// Every item of the array represent one of eight vertical
// squares.
let rowsTouch = [
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center),
    GridItem(.fixed(squareSize), spacing: spacingGameBoardSquares, alignment: .center)
]
