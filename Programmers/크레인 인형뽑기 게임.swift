//
//  크레인 인형뽑기 게임.swift
//  
//
//  Created by chihoooon on 2022/01/07.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var count = 0
    var stacks: [[Int]] = Array(repeating: [], count: board.count)
    var bucket: [Int] = []
    
    for row in board {
        for (index, doll) in row.enumerated() {
            if doll != 0 {
                stacks[index].append(doll)
            }
        }
    }
    
    for move in moves {
        if !stacks[move - 1].isEmpty {
            let doll = stacks[move - 1][0]
            print(doll)
            bucket.append(doll)
            stacks[move - 1].removeFirst()
        }
        
        if bucket.count >= 2 {
            let arraySlice = bucket.suffix(2)
            let checkArray = Array(arraySlice)
            print(checkArray)
            if checkArray[0] == checkArray[1] {
                bucket.popLast()
                bucket.popLast()
                count += 2
            }
        }
    }
    return count
}

