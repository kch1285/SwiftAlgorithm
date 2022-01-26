//
//  가장 먼 노드.swift
//  
//
//  Created by chihoooon on 2022/01/26.
//

import Foundation

func bfs(_ start: Int, graph: [[Int]], dist: [Int], visit: [Bool]) -> [Int] {
    var queue: [Int] = []
    var dist = dist
    var visit = visit
    
    queue.append(start)
    visit[start] = true
    
    while !queue.isEmpty {
        let src = queue.first!
        queue.removeFirst()
        graph[src].forEach {
            if !visit[$0] {
                queue.append($0)
                visit[$0] = true
                dist[$0] = dist[src] + 1
            }
        }
    }
    
    return dist
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    let dist = Array(repeating: 0, count: n)
    let visit = Array(repeating: false, count: n)
    var graph: [[Int]] = Array(repeating: [], count: n)
    
    edge.forEach {
        let x = $0[0] - 1
        let y = $0[1] - 1
        graph[x].append(y)
        graph[y].append(x)
    }
    
    let distanceArr = bfs(0, graph: graph, dist: dist, visit: visit)
    let maxNode = distanceArr.max()!
    
    return distanceArr.filter { $0 == maxNode }.count
}
