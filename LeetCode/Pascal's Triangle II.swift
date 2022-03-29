//
//  Pascal's Triangle II.swift
//  
//
//  Created by chihoooon on 2022/03/29.
//

import Foundation

func getRow(_ rowIndex: Int) -> [Int] {
    if rowIndex < 2 {
        return Array(repeating: 1, count: rowIndex + 1)
    }
    
    var map = Array(repeating: Array(repeating: 0, count: rowIndex + 1), count: rowIndex + 1)
    
    for i in 0...rowIndex {
        map[i][0] = 1
        map[i][i] = 1
    }
    
    for i in 2...rowIndex {
        for j in 1..<i {
            map[i][j] = map[i - 1][j - 1] + map[i - 1][j]
        }
    }
    
    return map[rowIndex]
}
