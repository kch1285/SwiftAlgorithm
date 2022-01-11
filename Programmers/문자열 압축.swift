//
//  문자열 압축.swift
//  
//
//  Created by chihoooon on 2022/01/11.
//

import Foundation

func solution(_ s:String) -> Int {
    var answer: Int = 1001
    
    if s.count == 1 {
        return 1
    }
    for compressionWord in 1...s.count / 2 {
        let index: String.Index
        let remainder: String
        
        if s.count % compressionWord == 0 {
            index = s.index(s.startIndex, offsetBy: s.count)
            remainder = ""
        }
        else {
            let idx: Int = s.count / compressionWord
            index = s.index(s.startIndex, offsetBy: compressionWord * idx)
            remainder = s.substring(from: index)
        }
        
        let checkString = s.substring(to: index)
        var compressedWord: String = ""
        var x = 0
        var splitString: [String] = []
        
        while x < checkString.count / compressionWord {
            let start = checkString.index(checkString.startIndex, offsetBy: x * compressionWord)
            let end = checkString.index(start, offsetBy: compressionWord)
            let range = start..<end
            
            splitString.append(checkString.substring(with: range))
            x += 1
        }
        
        x = 1
        var compareString: String = splitString[0]
        var cnt: Int = 1
        
        while x < splitString.count {
            if compareString == splitString[x] {
                cnt += 1
                splitString.remove(at: x)
            }
            else {
                if cnt == 1 {
                    compressedWord += compareString
                }
                else {
                    compressedWord += String(cnt) + compareString
                    cnt = 1
                }
                compareString = splitString[x]
                x += 1
            }
        }
        if cnt == 1 {
            compressedWord += compareString
        }
        else {
            compressedWord += String(cnt) + compareString
        }
        
        compressedWord += remainder
        if answer >= compressedWord.count {
            answer = compressedWord.count
        }
    }
    
    
    return answer
}
