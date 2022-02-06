//
//  모음 사전.swift
//  
//
//  Created by chihoooon on 2022/02/06.
//

import Foundation

func solution(_ word:String) -> Int {
    let words = ["A", "E", "I", "O", "U"]
    var dict: [String] = []
    
    for i in 0..<5 {
        dict.append(words[i])
        for j in 0..<5 {
            dict.append(words[i] + words[j])
            for k in 0..<5 {
                dict.append(words[i] + words[j] + words[k])
                for l in 0..<5 {
                    dict.append(words[i] + words[j] + words[k] + words[l])
                    for m in 0..<5 {
                        dict.append(words[i] + words[j] + words[k] + words[l] + words[m])
                    }
                }
            }
        }
    }
    dict.sort()
    
    for (index, value) in dict.enumerated() {
        if value == word {
            return index + 1
        }
    }
    
    return 0
}
