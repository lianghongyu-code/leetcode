//
//  0153_寻找旋转排序数组中的最小值.swift
//  算法-Swift
//
//  Created by liang on 2021/7/31.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array/description/
// 元素互不相同

import Foundation

func findMin(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    if right == left {
        return nums[left]
    }
    while left < right {
//        let mid = (left + right) / 2
        let mid = left + (right - left) / 2 // 防止溢出
        if nums[mid] > nums[right] {
            left = mid + 1 // 在右边 不可能是mid所以+1
        } else {
            right = mid // 在左边 可能是mid所以=
        }
    }
    return nums[left]
}
