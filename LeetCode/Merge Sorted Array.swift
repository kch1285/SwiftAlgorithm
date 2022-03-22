//
//  Merge Sorted Array.swift
//  
//
//  Created by chihoooon on 2022/03/22.
//

import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    nums1.removeLast(n)
    nums1 = nums1 + nums2
    nums1.sort()
}
