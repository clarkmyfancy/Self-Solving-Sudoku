import Foundation
import UIKit

struct PuzzleProvider {
    
//    let BLANK_PUZZLE = Array(repeating: Array(repeating: 0, count: 9), count: 9)
//    var puzzle = [[Int]]()

    let puzzle: [[Int]] = [
        [0, 8, 5, 4, 0, 0, 2, 0, 0],
        [0, 4, 6, 0, 0, 2, 0, 7, 0],
        [0, 0, 0, 6, 0, 3, 5, 4, 0],
        
        [0, 0, 0, 0, 2, 5, 0, 1, 0],
        [7, 0, 0, 8, 6, 0, 0, 2, 0],
        [0, 0, 4, 1, 0, 7, 0, 0, 8],
        
        [4, 0, 0, 3, 0, 1, 0, 6, 2],
        [0, 0, 0, 7, 0, 0, 4, 0, 3],
        [0, 3, 0, 0, 4, 0, 1, 5, 0]
    ]

    let givens: [[Bool]] = [
        [false, true, true, true, false, false, true, false, false],
        [false, true, true, false, false, true, false, true, false],
        [false, false, false, true, false, true, true, true, false],

        [false, false, false, false, true, true, false, true, false],
        [true, false, false, true, true, false, false, true, false],
        [false, false, true, true, false, true, false, false, true],

        [true, false, false, true, false, true, false, true, true],
        [false, false, false, true, false, false, true, false, true],
        [false, true, false, false, true, false, true, true, false]
    ]
    
    func getPuzzle() -> [[Int]] {
        return self.puzzle
    }

    func getGivens() -> [[Bool]] {
        return givens
    }
}
