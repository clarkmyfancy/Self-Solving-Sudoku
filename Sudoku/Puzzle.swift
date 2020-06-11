
import Foundation


struct Puzzle {
    
    private static var rowCount = 9
    private static var columnCount = Puzzle.rowCount
    
    private var puzzle = [[Int]]()
    
    init() {
        puzzle = Array(repeating: Array(repeating: 0, count: Puzzle.columnCount), count: Puzzle.rowCount)}
    
    
    init(_ puzzle: [[Int]]) {
        self.puzzle = puzzle}
    
    
    func getRowCount() -> Int {
        return Puzzle.rowCount}
    
    
    func getColumnCount() -> Int {
        return Puzzle.columnCount}

    
    func row(at i: Int) throws -> [Int] {
        try ifIndexOutOfBoundsThrowError(index: i)
        return puzzle[i]}

    
    func col(at j: Int) throws -> [Int] {
        try ifIndexOutOfBoundsThrowError(index: j)
        var column = [Int]()
        for i in 0..<Puzzle.rowCount {
            column.append(puzzle[i][j])}
        return column}
    
    
    func getCellAt(row i: Int, col j: Int) throws -> Int {
        try ifIndexOutOfBoundsThrowError(index: i)
        try ifIndexOutOfBoundsThrowError(index: j)
        return puzzle[i][j]}
    
    
    func ifIndexOutOfBoundsThrowError(index i: Int) throws {
        if (i < 0) || (i >= Puzzle.rowCount) {
            throw OutOfBoundsError("Cannot access array, index [\(i)] out of bounds")}}
    
    
}

// think about the scope of this type of error, put it somewhere appropriot
struct OutOfBoundsError: Error {
    let message: String
    
    init(_ message: String) {
        self.message = message}
    
    public var localizedDescription: String {
        return message}
}




//
//  Puzzle.swift
//  Sudoku
//
//  Created by Jack Conrad Clark on 6/9/20.
//  Copyright © 2020 Jack Conrad Clark. All rights reserved.
//
