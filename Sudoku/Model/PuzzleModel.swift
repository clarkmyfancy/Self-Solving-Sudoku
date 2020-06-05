import Foundation
 
struct PuzzleModel {
    let givenCells: [CellModel]

    var puzzle: [[Int]] {
        var blankPuzzle: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        for cell in givenCells {
            blankPuzzle[cell.x][cell.y] = cell.value}
        return blankPuzzle}
}

struct CellModel {
    let x: Int
    let y: Int
    let value: Int
}
