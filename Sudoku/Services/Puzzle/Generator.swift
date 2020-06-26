import Foundation

struct Generator {
    
    func makePuzzle() -> Puzzle {
        // generate [[Int]] and fill with proper values
        // then initialize the puzzle using that [[Int]]
//        var puzzleData = [[Int]]()
//        for _ in 0..<9 {
//            let row = makeRow()
//            puzzleData.append(row)
//        }
        var candidate = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        var cellValue = 0
        for i in 0..<9 {
            for j in 0..<9 {
                cellValue += 1
                candidate[i][j] = cellValue
            }
            cellValue = 0
        }
        
        return Puzzle(candidate)
    }
    
//    func makeRow() -> [Int] {
//        return [1,2,3, 4,5,6, 7,8,9]
//    }
    
}


//
//  Generator.swift
//  Sudoku
//
//  Created by Jack Conrad Clark on 6/10/20.
//  Copyright © 2020 Jack Conrad Clark. All rights reserved.
//
