//
//  Two City Scheduling.swift
//  
//
//  Created by chihoooon on 2022/03/25.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    var totalCosts = costs.reduce(0) { $0 + $1[0] }
    let differences = costs.map { $0[1] - $0[0] }.sorted()
    
    for i in 0..<costs.count / 2 {
        totalCosts += differences[i]
    }
    
    return totalCosts
}
