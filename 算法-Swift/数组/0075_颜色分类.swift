//
//  0075_颜色分类.swift
//  算法
//
//  Created by liang on 2020/10/16.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/sort-colors/
/*
 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
 */

import Foundation

func sortColors(_ nums: inout [Int]) {
    var l0 = 0
    var l2 = nums.count - 1
    var cur = 0
    while cur <= l2 {
        if nums[cur] == 0 {
            (nums[l0], nums[cur]) = (nums[cur], nums[l0])
            l0 += 1
            cur += 1
        } else if nums[cur] == 1 {
            cur += 1
        } else {
            (nums[l2], nums[cur]) = (nums[cur], nums[l2])
            l2 -= 1
        }
    }
}
