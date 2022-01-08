//
//  배달.swift
//  
//
//  Created by chihoooon on 2022/01/08.
//

import Foundation

func floydwarshall(_ arr: [[Int]], _ n: Int) -> [[Int]] {
    var returnedArray = arr
    for through in 0..<n {
        for src in 0..<n {
            for dst in 0..<n {
                returnedArray[src][dst] = min(
                    returnedArray[src][dst],
                    returnedArray[src][through] + returnedArray[through][dst]
                )
            }
        }
    }
    return returnedArray
}

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var distance = [[Int]](repeating: [Int](repeating: 999999999, count: N), count: N)
    for i in 0..<road.count {
        let src = road[i][0] - 1
        let dst = road[i][1] - 1
        let cost = road[i][2]
        
        distance[src][dst] = min(distance[src][dst], cost)
        distance[dst][src] = min(distance[dst][src], cost)
    }
    
    for i in 0..<N {
        distance[i][i] = 0
    }
    
    let answer = floydwarshall(distance, N)
    return answer[0].filter{ $0 <= k}.count
}
