//
//  Verifying an Alien Dictionary.swift
//  
//
//  Created by chihoooon on 2022/03/21.
//

import Foundation

class Solution {
    func checkOrder(firstWord: [String], secondWord: [String], order: [String]) -> Bool {
        var idx = 0
        
        while idx < firstWord.count && idx < secondWord.count {
            if order.firstIndex(of: firstWord[idx])! == order.firstIndex(of: secondWord[idx])! {
                idx += 1
                continue
            }
            
            return order.firstIndex(of: firstWord[idx])! < order.firstIndex(of: secondWord[idx])!
        }
        
        return firstWord.count <= secondWord.count
    }
    
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        let order = order.map { String($0) }
        
        for i in 0..<words.count - 1 {
            let firstWord = words[i].map { String($0) }
            let secondWord = words[i + 1].map { String($0) }
            
            if !checkOrder(firstWord: firstWord, secondWord: secondWord, order: order) {
                return false
            }
        }
        
        return true
    }
}
