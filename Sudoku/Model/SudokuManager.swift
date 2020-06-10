//import Foundation
//import CoreFoundation
//
//struct SudokuManager {
//
//
////    var elapsedTime: Float?
////    var benchTimer: BenchTimer?
////    var timer = Timer()
////
////    let puzzleProvider = PuzzleProvider()
//    var puzzle: [[Int]]?
//    var givens:  [[Bool]]?
//
//    init() {
//        self.loadPuzzle()
//        self.loadGivens()
//    }
//
//    mutating func loadPuzzle() {
//        self.puzzle = puzzleProvider.getPuzzle()
//    }
//
//    mutating func loadGivens() {
//        self.givens = puzzleProvider.getGivens()
//    }
//
//    func getPuzzle() -> [[Int]]? {
//        if let puzzle = self.puzzle {
//            return puzzle
//        }
//        return nil
//    }
//
//    func returnsTrue() -> Bool {
//        return true
//    }
//
//
//
//
////    mutating func startTimer() {
////        self.benchTimer = BenchTimer()
////        self.timer.invalidate()
////        self.elapsedTime = 0.0}
//
////    mutating func getElapsedTime() -> Float {
////        timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: true, block: { (_) in
////            self.elapsedTime = Float(self.benchTimer!.elapsed())})
////        return self.elapsedTime!}
//
//    func getNumberUsingCoordinates(_ row: Int, _ col: Int) -> Int {
//        if let puzzle = self.puzzle {
//            return puzzle[row][col]
//        }
//        return 0
//    }
//
//    func determineWhetherNumberWasGivenUsingCoordinates(_ row: Int, _ col: Int) -> Bool {
//        if let givens = self.givens {
//            return givens[row][col] == false
//        }
//        return false
//    }
//
//    mutating func updateCellAtLocationWithNumber(x row: Int, y col: Int, _ selectedNumber: String) {
//        let newCellValue: Int
//        if selectedNumber == "" {
//            newCellValue = 0
//        } else {
//            newCellValue = Int(selectedNumber)!
//        }
//        puzzle![row][col] = newCellValue
//    }
//
//}
//
//
