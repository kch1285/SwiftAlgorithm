//
//  영어 끝말잇기.swift
//  
//
//  Created by chihoooon on 2022/01/18.
//

import Foundation

func checkLastWord(_ str1: String, _ str2: String) -> Bool {
    if str1.suffix(1) == str2.prefix(1), !wordSet.contains(str2) {
        return true
    }
    return false
}

var wordSet = Set<String>()

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var answer: [Int] = []
    var lastWord: String = ""
    var answerIndex = -1
    
    for (index, word) in words.enumerated() {
        if index == 0 {
            lastWord = word
            wordSet.insert(lastWord)
        }
        else {
            if checkLastWord(lastWord, word) {
                lastWord = word
                wordSet.insert(lastWord)
            }
            else {
                answerIndex = index
                break
            }
        }
    }
    
    if answerIndex < 0 {
        answer.append(0)
        answer.append(0)
    }
    
    else {
        let index = answerIndex + 1
        if index % n == 0 {
            answer.append(n)
            answer.append(index / n)
        }
        else {
            answer.append(index % n)
            answer.append(index / n + 1)
        }
    }
    
    return answer
}
