//
//  剑指57_和为s的两个数字.swift
//  算法-Swift
//
//  Created by liang on 2021/8/22.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/he-wei-sde-liang-ge-shu-zi-lcof/
// 输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，则输出任意一对即可。

import Foundation

func twoSum_57(_ nums: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = nums.count - 1
    while left < right {
        let sum = nums[left] + nums[right]
        if sum > target { // 大于右边-
            right -= 1
        } else if (sum < target) { // 小于左边+
            left += 1
        } else {
            return [nums[left], nums[right]]
        }
    }
    return []
}
