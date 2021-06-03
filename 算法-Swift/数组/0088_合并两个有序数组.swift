//
//  合并两个有序数组.swift
//  算法
//
//  Created by liang on 2020/7/18.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/merge-sorted-array/
// 初始化 nums1 和 nums2 的元素数量分别为 m 和 n
// 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素

import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    // 练习
    
    
    
    
    
    
    
    
    
    // 算法思路
    var len1 = m - 1
    var len2 = n - 1
    var len = m + n - 1
    
    while len1 >= 0 && len2 >= 0 {
        if nums1[len1] > nums2[len2] {
            nums1[len] = nums1[len1]
            len1 -= 1
        } else {
            nums1[len] = nums2[len2]
            len2 -= 1
        }
        len -= 1
    }
    
    // 如果len2还有的话 len1还有的话不需要处理
    while len2 >= 0 {
        nums1[len2] = nums2[len2]
        len2 -= 1
    }
    
    // Swift写法1
//    nums1.removeLast(n)
//    nums1.append(contentsOf: nums2)
//    nums1.sort()
    
    // Swift写法2
//    nums1 = (nums1[0..<m] + nums2).sorted()
}
