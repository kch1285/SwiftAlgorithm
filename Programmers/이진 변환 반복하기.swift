//
//  이진 변환 반복하기.swift
//  
//
//  Created by chihoooon on 2022/02/19.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var str = s
    var answer = [0, 0]
    
    while str != "1" {
        var length = str.count
        str = str.replacingOccurrences(of: "0", with: "")
        answer[0] += 1
        answer[1] += length - str.count
        length = str.count
        str = String(length, radix: 2)
    }
    return answer
}
