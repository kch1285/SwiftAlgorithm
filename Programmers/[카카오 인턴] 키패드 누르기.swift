//
//  [카카오 인턴] 키패드 누르기.swift
//  
//
//  Created by chihoooon on 2022/01/06.
//

import Foundation

let keypad = [
    "1": (0, 0), "2": (0, 1), "3": (0, 2),
    "4": (1, 0), "5": (1, 1), "6": (1, 2),
    "7": (2, 0), "8": (2, 1), "9": (2, 2),
    "*": (3, 0), "0": (3, 1), "#": (3, 2)
]


func dist(_ start: String, _ dest: String) -> Int {
    let x = keypad[start]!.0
    let y = keypad[start]!.1
    
    let xx = keypad[dest]!.0
    let yy = keypad[dest]!.1
    
    return abs(x-xx) + abs(y-yy)
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var left = "*"
    var right = "#"
    var answer = ""
    
    for number in numbers {
        if number == 1 || number == 4 || number == 7 {
            answer += "L"
            left = String(number)
        }
        
        else if number == 3 || number == 6 || number == 9 {
            answer += "R"
            right = String(number)
        }
        
        else {
            let leftDistance = dist(left, String(number))
            let rightDistance = dist(right, String(number))
            
            if leftDistance < rightDistance {
                answer += "L"
                left = String(number)
            }
            else if leftDistance > rightDistance {
                answer += "R"
                right = String(number)
            }
            else {
                if hand == "left" {
                    answer += "L"
                    left = String(number)
                }
                else if hand == "right" {
                    answer += "R"
                    right = String(number)
                }
            }
        }
    }
    return answer
}
