//
//  짝지어 제거하기.swift
//  
//
//  Created by chihoooon on 2022/01/13.
//

import Foundation

func solution(_ s:String) -> Int{
    var answer: Int = 0
    var stack: [Character] = []
    
    s.forEach {
        if stack.last == $0 {
            stack.removeLast()
        }
        else {
            stack.append($0)
        }
    }
    
    if stack.isEmpty {
        answer = 1
    }
    
    return answer
}
