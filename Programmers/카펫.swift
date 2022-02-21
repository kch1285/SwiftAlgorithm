//
//  카펫.swift
//  
//
//  Created by chihoooon on 2022/02/21.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let totalBlocks = brown + yellow
    var answer: [Int] = []
    
    for block in 1...Int(sqrt(Double(totalBlocks))) {
        if totalBlocks % block == 0 {
            let width = totalBlocks / block - 2
            let height = block - 2
            if width * height == yellow {
                answer.append(width + 2)
                answer.append(height + 2)
            }
        }
    }
    return answer
}
