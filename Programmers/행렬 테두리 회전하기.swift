//
//  행렬 테두리 회전하기.swift
//  
//
//  Created by chihoooon on 2022/01/10.
//

import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var arr: [[Int]] = Array(repeating: Array(repeating: 1, count: columns), count: rows)
    var answer: [Int] = []
    
    for i in 0..<rows {
        for j in 0..<columns {
            arr[i][j] = i * columns + j + 1
        }
    }
    
    for query in queries {
        let x1 = query[0] - 1
        let y1 = query[1] - 1
        let x2 = query[2] - 1
        let y2 = query[3] - 1
        var pos = (x1, y1)
        var preValue = arr[pos.0][pos.1]
        var minValue = min(rows * columns, preValue)
        
        while pos.1 < y2 {
            let tmp = preValue
            pos.1 += 1
            preValue = arr[pos.0][pos.1]
            arr[pos.0][pos.1] = tmp
            minValue = min(minValue, preValue)
        }
        
        while pos.0 < x2 {
            let tmp = preValue
            pos.0 += 1
            preValue = arr[pos.0][pos.1]
            arr[pos.0][pos.1] = tmp
            minValue = min(minValue, preValue)
        }
        
        while pos.1 > y1 {
            let tmp = preValue
            pos.1 -= 1
            preValue = arr[pos.0][pos.1]
            arr[pos.0][pos.1] = tmp
            minValue = min(minValue, preValue)
        }
        
        while pos.0 > x1 {
            let tmp = preValue
            pos.0 -= 1
            preValue = arr[pos.0][pos.1]
            arr[pos.0][pos.1] = tmp
            minValue = min(minValue, preValue)
        }
        answer.append(minValue)
    }
    
    return answer
}
