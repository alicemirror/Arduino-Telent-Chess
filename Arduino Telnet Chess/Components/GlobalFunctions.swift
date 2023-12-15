//
//  GlobalFunctions.swift
//  Arduino Telent chess
//
//  Created by Enrico Miglino on 3/12/23.
//

import Foundation

// check if the dividend is exactly divisible by the divisor
func isDivisionResultInteger(_ dividend: Int, _ divisor: Int) -> Bool {
    return divisor != 0 && dividend % divisor == 0
}

