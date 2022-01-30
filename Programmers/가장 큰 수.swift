//
//  가장 큰 수.swift
//  
//
//  Created by chihoooon on 2022/01/30.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    var answer: [String] = []
    numbers.forEach {
        answer.append(String($0))
    }
    
    if answer.filter { $0 == "0" }.count == answer.count {
        return "0"
    }
    
    return answer.sorted(by: { $0 + $1 > $1 + $0 }).reduce("") { $0 + $1 }
}
