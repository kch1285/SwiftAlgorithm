//
//  디스크 컨트롤러.swift
//  
//
//  Created by chihoooon on 2022/02/10.
//

import Foundation

func customizedSort(_ arr: [[Int]]) -> [[Int]] {
    return arr.sorted {
        if $0[0] < $1[0] {
            return true
        }
        else if $0[0] == $1[0] {
            return $0[1] < $1[1]
        }
        return false
    }
}

func solution(_ jobs: [[Int]]) -> Int {
    var totalTime = 0
    var currentTime = 0
    
    var sortedJobs = customizedSort(jobs)
    currentTime = sortedJobs[0][0]
    
    while !sortedJobs.isEmpty {
        var commingTasks = sortedJobs.filter { $0[0] <= currentTime + sortedJobs[0][1] }
        currentTime += sortedJobs[0][1]
        sortedJobs = sortedJobs.filter { !commingTasks.contains($0) }
        
        if commingTasks.count < 1 {
            currentTime = sortedJobs[0][0] + sortedJobs[0][1]
            totalTime += currentTime - sortedJobs[0][0]
            sortedJobs.removeFirst()
        }
        else {
            currentTime = max(currentTime, commingTasks[0][0] + commingTasks[0][1])
            totalTime += currentTime - commingTasks[0][0]
            commingTasks.removeFirst()
            
            if commingTasks.count > 0 {
                commingTasks.sort { $0[1] < $1[1] }
                sortedJobs = commingTasks + sortedJobs
            }
        }
    }
    return totalTime / jobs.count
}
