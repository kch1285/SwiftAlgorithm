//
//  괄호 회전하기.swift
//  
//
//  Created by chihoooon on 2022/01/14.
//

import Foundation

func checkBracket(_ bracket: String) -> Bool {
    var stack: [Character] = []
    var flag = true
    
    bracket.forEach {
        if $0 == "]" {
            if stack.last == "[" {
                stack.removeLast()
            }
            else {
                flag = false
            }
        }
        else if $0 == "[" {
            stack.append($0)
        }
        
        if $0 == "}" {
            if stack.last == "{" {
                stack.removeLast()
            }
            else {
                flag = false
            }
        }
        else if $0 == "{" {
            stack.append($0)
        }
        
        if $0 == ")" {
            if stack.last == "(" {
                stack.removeLast()
            }
            else {
                flag = false
            }
        }
        else if $0 == "(" {
            stack.append($0)
        }
    }
    
    if !stack.isEmpty {
        flag = false
    }
    return flag
}

func rotateBracket(_ bracket: String) -> String {
    var rotatedBracket = bracket
    let firstStr = rotatedBracket.first!
    rotatedBracket.removeFirst()
    rotatedBracket.append(firstStr)
    return rotatedBracket
}

func solution(_ s:String) -> Int {
    var answer = 0
    var str = s
    
    for _ in 0..<str.count {
        str = rotateBracket(str)
        if checkBracket(str) {
            answer += 1
        }
    }
    return answer
}
