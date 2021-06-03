//
//  0075_颜色分类.swift
//  算法
//
//  Created by liang on 2020/10/16.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/sort-colors/

import Foundation

func sortColors(_ nums: inout [Int]) {
    var l0 = 0
    var l2 = nums.count - 1
    var l = 0
    while l0 >= l2 {
        if nums[l] == 0 {
            (nums[l0], nums[l]) = (nums[l], nums[l0])
            l0 += 1
            l += 1
        } else if nums[l] == 1 {
            l += 1
        } else {
            (nums[l2], nums[l]) = (nums[l], nums[l2])
            l2 -= 1
            l += 1
        }
    }
}
