//
//  [1차] 뉴스 클러스터링.swift
//  
//
//  Created by chihoooon on 2022/01/29.
//

import Foundation

func splitTwo(_ str: String) -> [String] {
    var splitedString: [String] = []
    
    for i in 0..<str.count - 1 {
        let start = str.index(str.startIndex, offsetBy: i)
        let end = str.index(after: start)
        let splitString = String(str[start...end]).lowercased()
        
        if splitString.filter { $0.isLetter }.count == 2 {
            splitedString.append(splitString)
        }
    }
    return splitedString
}

func solution(_ str1: String, _ str2: String) -> Int {
    var strDict1: [String: Int] = [:]
    var strDict2: [String: Int] = [:]
    var jaccardA = 0
    var jaccardB = 0
    var jaccard: Double = 0.0
    
    splitTwo(str1).forEach {
        strDict1[$0] = (strDict1[$0] ?? 0) + 1
    }
    
    splitTwo(str2).forEach {
        strDict2[$0] = (strDict2[$0] ?? 0) + 1
    }
    
    let strSet1 = Set(strDict1.keys)
    let strSet2 = Set(strDict2.keys)
    let intersection = strSet1.intersection(strSet2)
    let union = strSet1.union(strSet2)
    
    intersection.forEach {
        jaccardA += min(strDict1[$0] ?? 0, strDict2[$0] ?? 0)
    }
    
    union.forEach {
        jaccardB += max(strDict1[$0] ?? 0, strDict2[$0] ?? 0)
    }
    
    jaccard = jaccardB == 0 ? 1 : Double(jaccardA) / Double(jaccardB)
    
    return Int(jaccard * 65536)
}
