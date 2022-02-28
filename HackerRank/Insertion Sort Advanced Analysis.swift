//
//  Insertion Sort Advanced Analysis.swift
//  
//
//  Created by chihoooon on 2022/02/28.
//

import Foundation

func insertionSort(arr: [Int]) -> Int {
    var shifts = 0
    var sortedArray = arr
    
    for i in 1..<sortedArray.count {
        for j in stride(from: i, to: 0, by: -1) {
            if sortedArray[j] < sortedArray[j - 1] {
                sortedArray.swapAt(j, j - 1)
                shifts += 1
            }
            else {
                break
            }
        }
    }
    
    return shifts
}
