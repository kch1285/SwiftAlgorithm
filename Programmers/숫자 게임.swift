//
//  숫자 게임.swift
//  
//
//  Created by chihoooon on 2022/02/15.
//

import Foundation

func solution(_ a: [Int], _ b: [Int]) -> Int {
    var sortedA = a.sorted(by: >)
    var sortedB = b.sorted(by: >)
    var answer = 0
    
    while !sortedA.isEmpty && !sortedB.isEmpty {
        if sortedA.first! < sortedB.first! {
            answer += 1
            sortedB.removeFirst()
        }
        sortedA.removeFirst()
    }
    
    return answer
}
