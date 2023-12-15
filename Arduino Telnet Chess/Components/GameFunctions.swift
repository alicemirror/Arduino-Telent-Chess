//
//  GameFunctions.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 3/12/23.
//

import Foundation

// check if the current square color should be white or black
// in respect to the position in the possible set of color couples.
func isLightSquare() -> Int {
    // Color index
    var idx: Int?
    // Get the index of the desired couple of colors array,
    // chose two by two. The first color is for white tiles
    // while the second is for the black tiles.
    let baseColorArray: Int? = boardThemes["white_teal"]



    if isWhite {
        idx = baseColorArray
        isWhite = false
    }
    else {
        idx = baseColorArray! + 1
        isWhite = true
    }
    
    // Increment the absolute number of calls to the function
    currentPosition += 1
    
    // Reset the current position when the call is che last
    // square of the board.
    if currentPosition >= 64 {
        currentPosition = 0
    }
    
    // Check if the current chessboard position is the first
    // of a row and invert the color flag isWhite to show
    // alternate colors on the chessboard.
    if isDivisionResultInteger(currentPosition, 8) {
        if isWhite {
            isWhite = false
        } else {
            isWhite = true
        }
    }
    
    return idx!
} // isLightSquare

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
    // ... handle pieces
    default: return ""
    } // switch piece
} // funct iconName
