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
let boardPiecesOnStart: [[String]] = [
    ["R", "N", "B", "Q", "K", "B", "N", "R"],
    ["P", "P", "P", "P", "P", "P", "P", "P"],
    ["", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", ""],
    ["r", "n", "b", "q", "k", "b", "n", "r"],
    ["p", "p", "p", "p", "p", "p", "p", "p"]
]

// Decide alternatively the color of every square tile of the board.
var isWhite: Bool = true

// Get the index of the desired couple of colors array,
// chose two by two. The first color is for white tiles
// while the second is for the black tiles.
var baseColorArray: Int = 6

// The current position in the 8x8 array
var currentPosition: Int = 0

