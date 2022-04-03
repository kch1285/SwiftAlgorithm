//
//  Median of Two Sorted Arrays.swift
//  
//
//  Created by chihoooon on 2022/04/03.
//

import Foundation

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var mergedArray: [Int] = []
    var index1 = 0
    var index2 = 0
    let length = nums1.count + nums2.count
    
    while index1 < nums1.count && index2 < nums2.count {
        if nums1[index1] < nums2[index2] {
            mergedArray.append(nums1[index1])
            index1 += 1
        }
        else {
            mergedArray.append(nums2[index2])
            index2 += 1
        }
    }
    
    mergedArray += index1 < nums1.count ? nums1[index1..<nums1.count] : nums2[index2..<nums2.count]
    
    return length % 2 == 0 ? Double(mergedArray[length / 2 - 1] + mergedArray[length / 2]) / 2 : Double(mergedArray[length / 2])
}
