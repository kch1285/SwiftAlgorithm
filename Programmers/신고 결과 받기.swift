//
//  신고 결과 받기.swift
//  
//
//  Created by chihoooon on 2022/02/02.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportInfo: [String: Set<String>] = [:]
    var user: [String: Int] = [:]
    var answer: [Int] = Array(repeating: 0, count: id_list.count)
    
    for (index, id) in id_list.enumerated() {
        user[id] = index
        reportInfo[id] = []
    }
    
    report.forEach {
        let info = $0.components(separatedBy: " ")
        let reporter = info[0]
        let reported = info[1]
        
        reportInfo[reported]!.insert(reporter)
    }
    
    let resultMail = reportInfo.filter{ $0.value.count >= k }.values.map{ Array($0) }
    
    resultMail.forEach {
        $0.forEach {
            answer[user[$0]!] += 1
        }
    }
    
    return answer
}
