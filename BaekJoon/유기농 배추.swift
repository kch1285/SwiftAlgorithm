//
//  유기농 배추.swift
//  
//
//  Created by chihoooon on 2022/01/16.
//

import Foundation

let dx: [Int] = [0, 0, 1, -1]
let dy: [Int] = [-1, 1, 0, 0]
let t = Int(readLine()!)!

for _ in 0..<t {
    var answer = 0
    let cabbage = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let m = cabbage[0]
    let n = cabbage[1]
    let k = cabbage[2]
    
    var field: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    var visit: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
    
    func dfs(_ x: Int, y: Int) {
        for i in 0..<4 {
            let nx = y + dx[i]
            let ny = x + dy[i]
            if (nx < 0 || nx >= n || ny < 0 || ny >= m) { continue }
            if !visit[nx][ny] && field[nx][ny] == 1 {
                visit[nx][ny] = true
                dfs(ny, y: nx)
            }
        }
    }
    
    for _ in 0..<k {
        let location = readLine()!.components(separatedBy: " ").map { Int($0)! }
        let x = location[0]
        let y = location[1]
        field[y][x] = 1
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if field[i][j] == 1 && !visit[i][j] {
                answer += 1
                visit[i][j] = true
                dfs(j, y: i)
            }
        }
    }
    
    print(answer)
}
