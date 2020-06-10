
import Foundation


struct Puzzle {
    
    private var puzzle: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    
    func row(at i: Int) throws -> [Int] {
        try ifIndexOutOfBoundsThrowError(index: i)
        return puzzle[i]}
    
    func col(at j: Int) throws -> [Int] {
        try ifIndexOutOfBoundsThrowError(index: j)
        var column = [Int]()
        for i in 0..<9 {
            column.append(puzzle[i][j])}
        return column}
    
    func ifIndexOutOfBoundsThrowError(index i: Int) throws {
        if (i < 0) || (i >= 9) {
            throw OutOfBoundsError("Cannot access array, index [\(i)] out of bounds")}}
}

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
