//
//  체육복.swift
//  
//
//  Created by chihoooon on 2022/01/09.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var reserveSet = Set(reserve)
    var lostSet = Set(lost)
    var kindPeople = Array(reserveSet.subtracting(lostSet)).sorted()
    let lostPeople = Array(lostSet.subtracting(reserveSet)).sorted()
    var answer = n - lostPeople.count
    
    lostPeople.forEach {
        if kindPeople.contains($0 - 1) {
            let idx = kindPeople.firstIndex(of: $0 - 1)!
            kindPeople.remove(at: idx)
            answer += 1
        }
        else if kindPeople.contains($0 + 1) {
            let idx = kindPeople.firstIndex(of: $0 + 1)!
            kindPeople.remove(at: idx)
            answer += 1
        }
    }
    return answer
}
