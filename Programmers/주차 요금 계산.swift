//
//  주차 요금 계산.swift
//  
//
//  Created by chihoooon on 2022/02/09.
//

import Foundation

func calcTimeToInt(_ timeInfo: String) -> Int {
    let time = timeInfo.components(separatedBy: ":")
    let h = Int(time[0])!
    let m = Int(time[1])!
    
    return h * 60 + m
}

func calcFee(_ fees: [Int], time: Int) -> Int {
    let standardTime = fees[0]
    let standardFee = fees[1]
    let unitTime = fees[2]
    let unitFee = fees[3]
    
    if time <= standardTime {
        return standardFee
    }
    
    return standardFee + Int(ceil((Double(time) - Double(standardTime)) / Double(unitTime))) * unitFee
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var result: [String: Int] = [:]
    var totalTimeInfo: [String: [Int]] = [:]
    let endOfTheDay = 60 * 23 + 59
    
    records.forEach {
        let info = $0.components(separatedBy: " ")
        let time = info[0]
        let carNumber = info[1]
        
        if totalTimeInfo[carNumber] == nil {
            totalTimeInfo[carNumber] = []
            result[carNumber] = 0
        }
        totalTimeInfo[carNumber]!.append(calcTimeToInt(time))
    }
    
    for (key, value) in totalTimeInfo {
        if value.count % 2 != 0 {
            totalTimeInfo[key]!.append(endOfTheDay)
        }
    }
    
    for info in totalTimeInfo {
        let inTime = stride(from: 0, to: info.value.count, by: 2).map { info.value[$0] }.reduce(0) { $0 + $1 }
        let outTime = stride(from: 1, to: info.value.count, by: 2).map { info.value[$0] }.reduce(0) { $0 + $1 }
        
        let parkingTime = outTime - inTime
        result[info.key] = calcFee(fees, time: parkingTime)
    }
    
    return result.sorted { $0.key < $1.key }.map { $0.value }
}
