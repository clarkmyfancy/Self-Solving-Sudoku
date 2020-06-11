import XCTest

@testable import Sudoku

class PuzzleTest: XCTestCase {
    
    var target: Puzzle!

    override func setUpWithError() throws {
        super.setUp()
        let mockPuzzle = Array(repeating: Array(repeating: -2, count: 9), count: 9)
        target = Puzzle(mockPuzzle)}

    
    override func tearDownWithError() throws {
        target = nil
        super.tearDown()}
    
    
    func test_WhenAskedForAnyRowInBounds_returnsArrayOfCorrectCount() throws {
        for i in 0..<target.getRowCount() {
            let row = try target.row(at: i)
            XCTAssertEqual(target.getColumnCount(), row.count, "\(#function): returned row of incorrect length.")}}
    
    
    func test_WhenAskedForRowUnderBounds_throwsOutOfBoundsError() throws {
        XCTAssertThrowsError(try target.row(at: -1), "When asked for a row that's out of bounds to the left, an exception was not thrown.") { (e) in
            print(e.localizedDescription)}}

    
    func test_WhenAskedForRowOverBounds_throwsOutOfBoundsError() throws {
        XCTAssertThrowsError(try target.row(at: target.getRowCount()), "When asked for a row that's out of bounds to the right, an exception was not thrown.") { (e) in
            print(e.localizedDescription)}}
    
    
    func test_WhenAskedForAnyColumnInBounds_returnsArrayOfCorrectCount() throws {
        for j in 0..<target.getColumnCount() {
            let col = try target.col(at: j)
            XCTAssertEqual(target.getRowCount(), col.count, "\(#function): returned row of incorrect length.")}}
    
    
    func test_WhenAskedForColUnderBounds_throwsOutOfBoundsError() throws {
        XCTAssertThrowsError(try target.col(at: -1), "When asked for a column that's out of bounds to the left, an exception was not thrown.") { (e) in
            print(e.localizedDescription)}}
    
    
    func test_WhenAskedForColOverBounds_throwsOutOfBoundsError() throws {
        let columnCount = target.getColumnCount()
        XCTAssertThrowsError(try target.col(at: columnCount), "When asked for a column that's out of bounds to the right, an exception was not thrown.") { (e) in
            print(e.localizedDescription)}}

    
    func test_WhenAskedForCellAtLocationWithinBounds_returnsCorrectInteger() throws {
        for i in 0..<target.getRowCount()  {
            for j in 0..<target.getColumnCount() {
                let result = try target.getCellAt(row: i, col: j)
                XCTAssertEqual(-2, result)}}}
    
    
    func test_WhenAskedForCellAtLocationUnderRowBounds_throwsOutOfBoundsError() throws {
        for j in 0..<target.getColumnCount() {
            XCTAssertThrowsError(try target.getCellAt(row: -1, col: j), "When asked for cell at a location where the row specified is under bounds, did not throw error.") { (e) in
                print(e.localizedDescription)}}}
    
    
    func test_WhenAskedForCellAtLocationOverRowBounds_throwsOutOfBoundsError() throws {
        for j in 0..<target.getColumnCount() {
            XCTAssertThrowsError(try target.getCellAt(row: target.getRowCount(), col: j), "When asked for cell at a location where the row specified is over bounds, did not throw error.") { (e) in
                print(e.localizedDescription)}}}
    
    
    func test_WhenAskedForCellAtLocationUnderColumnBounds_throwsOutOfBoundsError() throws {
        for i in 0..<target.getRowCount() {
            XCTAssertThrowsError(try target.getCellAt(row: i, col: -1), "When asked for cell at a location where the column specified is under bounds, did not throw error.") { (e) in
                print(e.localizedDescription)}}}
    
    
    func test_WhenAskedForCellAtLocationOverColumnBounds_throwsOutOfBoundsError() throws {
        for i in 0..<target.getRowCount() {
            XCTAssertThrowsError(try target.getCellAt(row: i, col: target.getColumnCount()), "When asked for cell at a location where the column specified is over bounds, did not throw error.") { (e) in
                print(e.localizedDescription)}}}
    
    
    
}


//
//  PuzzleTest.swift
//  SudokuTests
//
//  Created by Jack Conrad Clark on 6/9/20.
//  Copyright © 2020 Jack Conrad Clark. All rights reserved.
//
