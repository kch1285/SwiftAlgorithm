//
//  메뉴 리뉴얼.swift
//  
//
//  Created by chihoooon on 2022/01/19.
//

import Foundation

extension Array {
    var combination: [[Element]] {
        guard !isEmpty else { return [[]] }
        return Array(self[1...]).combination.flatMap { [$0, [self[0]] + $0] }
    }
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var combArr: [[Array<Character>]] = []
    var sortedOrders: [String] = []
    var answer: [String] = []
    
    orders.forEach {
        sortedOrders.append(String($0.sorted()))
    }
    
    for setCount in course {
        combArr = []
        var setMenu: [Array<Character>: Int] = [:]
        sortedOrders.forEach {
            var arr = Array($0)
                .combination
                .filter { $0.count == setCount }
            
            combArr.append(arr)
        }
        
        for i in 0..<combArr.count - 1 {
            var maxCount = 0
            for j in 0..<combArr[i].count {
                var count = 0
                for k in i+1..<combArr.count {
                    if combArr[k].contains(combArr[i][j]) {
                        count += 1
                    }
                }
                if count > 0 && maxCount <= count {
                    maxCount = count
                    if !setMenu.contains(where: { $0.0 == combArr[i][j] }) {
                        setMenu.updateValue(count, forKey: combArr[i][j])
                    }
                    
                }
            }
        }
        let sortedSetMenu = setMenu.sorted { $0.1 > $1.1 }
        if let count = sortedSetMenu.first?.value {
            let menu = sortedSetMenu.filter { $0.value == count }.map { $0.0 }
            menu.forEach {
                answer.append(String($0))
            }
        }
    }
    
    answer.sort()
    return answer
}
