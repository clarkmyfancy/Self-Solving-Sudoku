import XCTest

@testable import Sudoku

class PuzzleGeneratorTest: XCTestCase {
    
    var target: Generator!
    let NumberOfRowsInPuzzle = 9
    let NumberOfColumnsInPuzzle = 9
    let NumberOfCellsInOneRow = 9
    let NumberOfCellsInOneColumn = 9

    
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

    
    func test_WhenAskedToCreatePuzzle_ReturnsPuzzleWithRowsHavingNumbers1Through9Inclusive() throws {
        let puzzle = target.makePuzzle()
        let expectedNumberSet = [1,2,3, 4,5,6, 7,8,9]
        for i in 0..<NumberOfRowsInPuzzle {
            let row = try puzzle.row(at: i)
            for value in row {
                XCTAssertEqual(true, expectedNumberSet.contains(value))
            }
        }
    }
    
    
    func test_WhenAskedToCreatePuzzle_ReturnsPuzzleWithColumnsHavingNumbers1Through9Inclusive() throws {
        let puzzle = target.makePuzzle()
        let expectedNumberSet = [1,2,3, 4,5,6, 7,8,9]
        for j in 0..<NumberOfColumnsInPuzzle {
            let column = try puzzle.col(at: j)
            for value in column {
                XCTAssertEqual(true, expectedNumberSet.contains(value))
            }
        }
    }
    
    func test_WhenAskedToCreatePuzzle_ReturnsPuzzleWithEachRowHavingNoDuplicatedNumbers() throws {
        let puzzle = target.makePuzzle()
        for i in 0..<NumberOfRowsInPuzzle {
            assertSingleRowHasNoDuplicateNumbers(try puzzle.row(at: i))}}
    
    
    func assertSingleRowHasNoDuplicateNumbers(_ row: [Int]) {
        var foundNumbers: [Int: Int] = [:]
        
        for cell in 0..<NumberOfCellsInOneRow {
            let value = row[cell]
            if valueHasBeenSeenAlready(&foundNumbers, value) {
                foundNumbers[value]! += 1}
            else {
                foundNumbers[value] = 1}}
        
        for aSpecificNumbersFrequency in foundNumbers {
            XCTAssertEqual(1, aSpecificNumbersFrequency.value)}}
    
    
    func valueHasBeenSeenAlready(_ foundNumbers: inout [Int:Int], _ value: Int) -> Bool {
        return foundNumbers[value] != nil}
    
    
//    func test_WhenAskedToMakeRow_rowIsReturnedHavingNoDuplicatedNumbers() {
//        var foundNumbers: [Int: Int] = [:]
//        let candidateRow = target.makeRow()
//        let numberOfCellsInTestRow = candidateRow.count
//
//        for i in 1...numberOfCellsInTestRow {
//            let cellValue = candidateRow[i - 1]
//            if foundNumbers[cellValue] != nil {
//                foundNumbers[cellValue]! += 1}
//            else {
//                foundNumbers[cellValue] = 1}}
//
//        for element in foundNumbers {
//            XCTAssertEqual(1, element.value)}}
    
    
//    func test_WhenAskedToMakeRow_rowIsReturnedOnlyHavingNumbers1Through9Inclusive() {
//        let idealNumbers = [1,2,3, 4,5,6, 7,8,9]
//        let row = target.makeRow()
//
//        for i in 0..<9 {
//            let candidateValue = row[i]
//            XCTAssertEqual(true, idealNumbers.contains(candidateValue))
//        }
//
//
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
