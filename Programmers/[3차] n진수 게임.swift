//
//  [3차] n진수 게임.swift
//  
//
//  Created by chihoooon on 2022/02/18.
//

import Foundation

func solution(_ n: Int, _ t: Int, _ m: Int, _ p: Int) -> String {
    let gameCnt = m * t
    var values: [String] = []
    var currentNumber = 0
    
    while values.count < gameCnt {
        values.append(contentsOf: String(currentNumber, radix: n).compactMap({ $0.uppercased() }))
        currentNumber += 1
    }
    
    return stride(from: p - 1, to: gameCnt, by: m).reduce("", { $0 + values[$1] })
}
