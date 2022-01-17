//
//  피로도.swift
//  
//
//  Created by chihoooon on 2022/01/17.
//

import Foundation

var answer: Int = 0
var visit: [Bool] = []

func dfs(_ fatigue: Int, _ dungeons: [[Int]], _ count: Int) {
    for (index, dungeon) in dungeons.enumerated() {
        if !visit[index] && dungeon[0] <= fatigue {
            visit[index] = true
            dfs(fatigue - dungeon[1], dungeons, count + 1)
            visit[index] = false
        }
    }
    answer = max(answer, count)
}

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    visit = [Bool](repeating: false, count: dungeons.count)
    dfs(k, dungeons, answer)
    
    return answer
}
