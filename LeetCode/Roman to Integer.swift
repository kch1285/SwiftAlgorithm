//
//  Roman to Integer.swift
//  
//
//  Created by chihoooon on 2022/04/02.
//

import Foundation

func romanToInt(_ s: String) -> Int {
    let romanNumeral: [Character: Int] = [
        "I": 1, "V": 5, "X": 10, "L": 50,
        "C": 100, "D": 500, "M": 1000
    ]
    
    if s.count == 1 {
        return romanNumeral[Character(s)]!
    }
    
    let words = Array(s)
    var answer = 0
    var idx = 0
    
    while idx < words.count - 1 {
        if romanNumeral[words[idx]]! < romanNumeral[words[idx + 1]]! {
            answer += romanNumeral[words[idx + 1]]! - romanNumeral[words[idx]]!
            idx += 2
        }
        
        else {
            answer += romanNumeral[words[idx]]!
            idx += 1
            
        }
        
        if idx == words.count - 1 {
            answer += romanNumeral[words[idx]]!
        }
    }
    
    return answer
}
