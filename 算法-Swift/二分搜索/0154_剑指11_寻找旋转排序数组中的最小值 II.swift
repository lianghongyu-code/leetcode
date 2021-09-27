//
//  0154_寻找旋转排序数组中的最小值 II.swift
//  算法-Swift
//
//  Created by liang on 2021/7/31.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array-ii/
// 元素可能重复

import Foundation

func findMin2(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    if right == left {
        return nums[left]
    }
    while left < right {
        let mid = left + (right - left) / 2
        if nums[mid] > nums[right] {
            left = mid + 1
        } else if nums[mid] < nums[right] {
            right = mid
        } else {
            right -= 1 // nums[right]跟nums[mid]相等 可以剔除
        }
    }
    return nums[left]
}
