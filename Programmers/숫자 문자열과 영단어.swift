//
//  숫자 문자열과 영단어.swift
//  
//
//  Created by chihoooon on 2022/01/05.
//

import Foundation

import Foundation

func solution(_ s:String) -> Int {
    var answer = s
    let dict: [String: Int] = ["zero" : 0, "one" : 1, "two" : 2,
                               "three" : 3, "four" : 4, "five" : 5,
                               "six" : 6, "seven" : 7, "eight" : 8,
                               "nine" : 9]
    
    for (key, value) in dict {
        answer = answer.replacingOccurrences(of: key, with: String(value))
    }
    
    return Int(answer) ?? 0
}
