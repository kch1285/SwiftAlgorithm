//
//  방문 길이.swift
//  
//
//  Created by chihoooon on 2022/01/23.
//

import Foundation

func solution(_ dirs: String) -> Int {
    var coordinate = [[Int]](repeating: [Int](repeating: 0, count: 6), count: 6)
    let direction = Array(dirs)
    var currentPos = [0, 0]
    var answer = Set<String>()
    
    coordinate[0][0] = 1
    
    for dir in direction {
        if dir == "U" {
            if currentPos[1] + 1 <= 5 {
                answer.insert("\(currentPos[0])" +
                              "\(currentPos[1])" +
                              "\(currentPos[0])" +
                              "\(currentPos[1] + 1)")
                
                answer.insert("\(currentPos[0])" +
                              "\(currentPos[1] + 1)" +
                              "\(currentPos[0])" +
                              "\(currentPos[1])")
                currentPos[1] += 1
            }
        }
        else if dir == "D" {
            if currentPos[1] - 1 >= -5 {
                answer.insert("\(currentPos[0])" +
                              "\(currentPos[1])" +
                              "\(currentPos[0])" +
                              "\(currentPos[1] - 1)")
                
                answer.insert("\(currentPos[0])" +
                              "\(currentPos[1] - 1)" +
                              "\(currentPos[0])" +
                              "\(currentPos[1])")
                currentPos[1] -= 1
            }
        }
        else if dir == "R" {
            if currentPos[0] + 1 <= 5 {
                answer.insert("\(currentPos[0])" +
                              "\(currentPos[1])" +
                              "\(currentPos[0] + 1)" +
                              "\(currentPos[1])")
                
                answer.insert("\(currentPos[0] + 1)" +
                              "\(currentPos[1])" +
                              "\(currentPos[0])" +
                              "\(currentPos[1])")
                currentPos[0] += 1
            }
        }
        else {
            if currentPos[0] - 1 >= -5 {
                answer.insert("\(currentPos[0])" +
                              "\(currentPos[1])" +
                              "\(currentPos[0] - 1)" +
                              "\(currentPos[1])")
                
                answer.insert("\(currentPos[0] - 1)" +
                              "\(currentPos[1])" +
                              "\(currentPos[0])" +
                              "\(currentPos[1])")
                currentPos[0] -= 1
            }
        }
    }
    
    return answer.count / 2
}
