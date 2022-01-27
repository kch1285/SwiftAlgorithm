//
//  n^2 배열 자르기.swift
//  
//
//  Created by chihoooon on 2022/01/27.
//

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int64] {
    var answer = [Int64]()
    let N = Int64(n)
    for i in left...right {
        answer.append(max(i / N, i % N) + 1)
    }
    
    return answer
}
