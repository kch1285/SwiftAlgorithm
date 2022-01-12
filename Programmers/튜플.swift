//
//  튜플.swift
//  
//
//  Created by chihoooon on 2022/01/12.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var answer: [Int] = []
    var str = s
    str.removeLast(2)
    str.removeFirst(2)
    
    str.components(separatedBy: "},{")
        .map { $0.components(separatedBy: ",").map { Int($0)! } }
        .sorted { $0.count < $1.count }
        .forEach {
            $0.forEach {
                if !answer.contains($0) {
                    answer.append($0)
                }
            }
        }
    
    return answer
}
