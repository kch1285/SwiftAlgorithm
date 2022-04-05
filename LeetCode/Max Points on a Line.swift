//
//  Max Points on a Line.swift
//  
//
//  Created by chihoooon on 2022/04/05.
//

import Foundation

func maxPoints(_ points: [[Int]]) -> Int {
    var maxCount = 1
    
    for i in 0..<points.count - 1 {
        for j in i + 1..<points.count {
            var pointCount = 1
            
            if points[i][0] == points[j][0] {
                for k in j..<points.count {
                    if points[i][0] == points[k][0] {
                        pointCount += 1
                    }
                }
            }
            else if points[i][1] == points[j][1] {
                for k in j..<points.count {
                    if points[i][1] == points[k][1] {
                        pointCount += 1
                    }
                }
            }
            else {
                let gradient = getGradient(points[i], points[j])
                for k in j..<points.count {
                    if gradient == getGradient(points[i], points[k]) {
                        pointCount += 1
                    }
                }
            }
            
            maxCount = max(maxCount, pointCount)
        }
    }
    
    return maxCount
}

func getGradient(_ point1: [Int], _ point2: [Int]) -> Double {
    let dx = point1[0] - point2[0]
    let dy = point1[1] - point2[1]
    
    return Double(dy) / Double(dx)
}
