//
//  다단계 칫솔 판매.swift
//  
//
//  Created by chihoooon on 2022/02/13.
//

import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var members: [String: Int] = [:]
    var recommenderInfo: [String: String] = [:]
    var answer: [Int] = []
    
    for (index, person) in enroll.enumerated() {
        members[person] = 0
        recommenderInfo[person] = referral[index]
    }
    
    for (index, salesman) in seller.enumerated() {
        var profit = amount[index] * 100
        var recommender = seller[index]
        
        while recommender != "-" && profit > 0 {
            members[recommender]! += profit - profit / 10
            recommender = recommenderInfo[recommender]!
            profit = profit / 10
        }
    }
    
    for salesman in enroll {
        answer.append(members[salesman]!)
    }
    
    return answer
}
