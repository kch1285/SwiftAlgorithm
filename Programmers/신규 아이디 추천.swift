//
//  신규 아이디 추천.swift
//  
//
//  Created by chihoooon on 2022/01/04.
//

import Foundation

func removeSpecialCharacters(_ str: String) -> String {
    var removedString = ""
    
    for chr in str {
        if chr.isLetter || chr.isNumber || chr == "-" || chr == "_" || chr == "." {
            removedString.append(chr)
        }
    }
    return removedString
}

func removeContinuousDots(_ str: String) -> String {
    var removedString = str
    while removedString.contains("..") {
        removedString = removedString.replacingOccurrences(of: "..", with: ".")
    }
    return removedString
}

func setLengthToFifteen(_ str: String) -> String {
    var removedString = str
    
    if removedString.count >= 16 {
        let index = removedString.index(removedString.startIndex, offsetBy: 15)
        removedString = String(removedString[removedString.startIndex..<index])
        
        if removedString.hasSuffix(".") {
            removedString.removeLast()
        }
    }
    return removedString
}

func solution(_ new_id:String) -> String {
    var newID = removeSpecialCharacters(new_id)
    newID = newID.lowercased
    newID = removeContinuousDots(newID)
    newID = newID.trimmingCharacters(in: ["."])
    
    if newID.isEmpty {
        newID += "a"
    }
    
    newID = setLengthToFifteen(newID)
    
    while newID.count <= 2 {
        newID.append(newID.last!)
    }
    
    return newID
}
