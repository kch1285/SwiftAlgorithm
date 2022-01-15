//
//  H-Index.swift
//  
//
//  Created by chihoooon on 2022/01/15.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    let maxNumber = citations.max()!
    var answer = 0
    for i in 0...maxNumber {
        let citation = citations.filter { $0 >= i }.map{ $0 }
        let rest = citations.filter { $0 < i }.map{ $0 }
        
        if citation.count >= i && rest.count <= i {
            answer = i
        }
    }
    
    return answer
}
