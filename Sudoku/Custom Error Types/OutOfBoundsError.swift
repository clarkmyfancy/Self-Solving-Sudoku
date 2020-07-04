import Foundation

struct OutOfBoundsError: Error {
    let message: String
    
    init(_ message: String) {
        self.message = message}
    
    public var localizedDescription: String {
        return message}
}

//
//  OutOfBoundsError.swift
//  Sudoku
//
//  Created by Jack Conrad Clark on 7/4/20.
//  Copyright © 2020 Jack Conrad Clark. All rights reserved.
//
