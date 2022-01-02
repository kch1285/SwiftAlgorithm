//
//  로또의 최고 순위와 최저 순위.swift
//  
//
//  Created by chihoooon on 2022/01/03.
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var answer: [Int] = []
    var highestRank = 0
    var lowestRank = 0
    
    for lotto in lottos {
        if lotto == 0 {
            highestRank += 1
        }
        else if win_nums.contains(lotto) {
            lowestRank += 1
        }
    }
    
    highestRank += lowestRank
    
    switch highestRank {
    case 6: answer.append(1)
    case 5: answer.append(2)
    case 4: answer.append(3)
    case 3: answer.append(4)
    case 2: answer.append(5)
    default: answer.append(6)
    }
    
    switch lowestRank {
    case 6: answer.append(1)
    case 5: answer.append(2)
    case 4: answer.append(3)
    case 3: answer.append(4)
    case 2: answer.append(5)
    default: answer.append(6)
    }
    
    return answer
}

