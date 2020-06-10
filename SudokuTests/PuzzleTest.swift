//
//  PuzzleTest.swift
//  SudokuTests
//
//  Created by Jack Conrad Clark on 6/9/20.
//  Copyright © 2020 Jack Conrad Clark. All rights reserved.
//

import XCTest

@testable import Sudoku

class PuzzleTest: XCTestCase {
    
    var sut: Puzzle!

    override func setUpWithError() throws {
        super.setUp()
        sut = Puzzle()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
//    func testCreateObject_returnedObjectWorksAsExpected() {
//        testPuzzle = [
//            [1,2,3,4,5,6,7,8,9],
//            [2,3,4,5,6,7,8,9,1]
//        ]
//        
//        sut.loadPuzzle(testPuzzle)
//        XctassertE
//    }

    func testWhenAskedForFirstRow_returnsArrayOfInts() {
        do {
            let row = try sut.row(at: 0)
            XCTAssert(row is [Int], "First row of puzzle is not an array of integers.")
        }
        catch {
            print(error)
        }
    }
    
    func testWhenAskedForAnyRowInBounds_returnsArrayOfInts() {
        for i in 0..<9 {
            XCTAssertTrue(try sut.row(at: i) is [Int], "\(i + 1) row of puzzle is not an array of integers.")
        }
    }
    
    func testWhenAskedForRowOutsideBounds_throwsOutOfBoundsException() throws {
        XCTAssertThrowsError(try sut.row(at: -1), "When asked for a row that's out of bounds, an exception was not thrown.") { (e) in
            print(e)
        }
    }
    
    func testWhenAskedForAnyColInBounds_returnsArrayOfInts() {
        for j in 0..<9 {
            XCTAssertTrue(try sut.col(at: j) is [Int], "\(j + 1) column of puzzle is not an array of integers.")
        }
    }

}
