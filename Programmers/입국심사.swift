//
//  입국심사.swift
//  
//
//  Created by chihoooon on 2022/01/25.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var start: Int64 = Int64(times.min()!)
    var end: Int64 = Int64(times.max()! * n)
    var answer: Int64 = 0
    
    while start < end {
        let mid = (start + end) / 2
        var completedPeople: Int64 = 0
        
        // mid 시간안에 처리할 수 있는 총 사람수
        times.forEach {
            completedPeople += mid / Int64($0)
        }
        // 처리할수 있는 사람 수가 처리해야되는 사람 수보다 적으면 시간을 너무 빡빡하게 잡았음
        if completedPeople < n {
            start = mid + 1
        }
        // 처리할수 있는 사람 수가 처리해야되는 사람 수보다 많으면 시간을 너무 여유있게 잡았음
        else {
            end = mid
        }
    }
    answer = start
    return answer
}
