//
//  없는 숫자 더하기.swift
//  
//
//  Created by chihoooon on 2022/01/31.
//

import Foundation

func solution(_ numbers:[Int]) -> Int {
    return numbers.reduce(45) { $0 - $1 }
}
