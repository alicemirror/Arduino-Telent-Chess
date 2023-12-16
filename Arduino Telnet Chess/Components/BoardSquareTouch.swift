//
//  BoardSquareTouch.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 13/12/23.
//

import SwiftUI

// Design a the stroke around square of the chessboard
// used to evidentiate the status of the selected position.
struct BoardSquareTouch: View {
    var isSelected: Bool
    var squareBoardSize: CGFloat

    var body: some View {
        Rectangle()
            .frame(width: squareBoardSize,
                   height: squareBoardSize,
                   alignment: .center)
            .cornerRadius(tilesCornerRadius)
            .foregroundStyle(appColors["selected"]!)
            .opacity(isSelected ? transparencyTouch["touched"]! : transparencyTouch["untouched"]!)
    }
}
