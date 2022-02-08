//
//  JadenCase 문자열 만들기.swift
//  
//
//  Created by chihoooon on 2022/02/08.
//

import Foundation

func solution(_ s:String) -> String {
    var answer = ""
    let str = s.components(separatedBy: " ")
    str.forEach {
        answer += $0.prefix(1).uppercased() + $0.lowercased().dropFirst() + " "
    }
    answer.removeLast()
    return answer
}
