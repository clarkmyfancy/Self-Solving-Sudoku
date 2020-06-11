import XCTest

@testable import Sudoku

class PuzzleGeneratorTest: XCTestCase {
    
    var target: Generator!
    let NumberOfRowsInPuzzle = 9
    let NumberOfColumnsInPuzzle = 9
    let NumberOfCellsInOneRow = 9

    
    override func setUpWithError() throws {
        super.setUp()
        target = Generator()}

    
    override func tearDownWithError() throws {
        target = nil
        super.tearDown()}

    
    func test_WhenAskedToCreatePuzzleWithNoArguments_returnsPuzzleWithCorrectRowLengths() {
        let candidatePuzzle = target.makePuzzle()
        for i in 0..<NumberOfRowsInPuzzle {
            XCTAssertEqual(9, try candidatePuzzle.row(at: i).count)}}
    
    
    func test_WhenAskedToCreatePuzzleWithNoArguments_returnsPuzzleWithCorrectColumnLengths() {
        let candidatePuzzle = target.makePuzzle()
        for j in 0..<NumberOfColumnsInPuzzle {
            XCTAssertEqual(9, try candidatePuzzle.col(at: j).count)}}
    
    
    func test_WhenAskedToCreatePuzzleWithNoArguments_returnsPuzzleWithAllCellsHavingNonNilValues() {
        let candidatePuzzle = target.makePuzzle()
        for i in 0..<NumberOfRowsInPuzzle {
            for j in 0..<NumberOfColumnsInPuzzle {
                XCTAssertNotNil(try candidatePuzzle.getCellAt(row: i, col: j))}}}

    
    func test_WhenAskedToMakeRow_rowIsReturnedHavingNoDuplicatedNumbers() {
        var foundNumbers = Array(repeating: false, count: 9)
        let candidateRow = target.makeRow()
        for i in 0..<NumberOfCellsInOneRow {
            let cellValue = candidateRow[i]
            if numberIsUniqueInRow(in: foundNumbers, cellValue) {
                foundNumbers[cellValue - 1] = true}
            else {
                foundNumbers[cellValue - 1] = false}}
        for isNumberUnique in foundNumbers {
            XCTAssertEqual(isNumberUnique, true)}}
    
    
    func numberIsUniqueInRow(in foundNumbers: [Bool], _ cellValue: Int) -> Bool {
        let cellValueIndex = cellValue - 1
        return !foundNumbers[cellValueIndex]}
    
//    func test_WhenAskedToMakeRow_rowIsReturnedHavingNumbers1Through9Inclusive() {
//
//    }
}


//
//  PuzzleGeneratorTest.swift
//  SudokuTests
//
//  Created by Jack Conrad Clark on 6/10/20.
//  Copyright © 2020 Jack Conrad Clark. All rights reserved.
//
