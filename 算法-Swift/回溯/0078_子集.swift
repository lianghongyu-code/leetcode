//
//  0078_子集.swift
//  算法
//
//  Created by liang on 2020/9/25.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/subsets/
// 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

import Foundation

private var res = [[Int]]()
func subsets(_ nums: [Int]) -> [[Int]] {
    var cur = [Int]()
    subsets_helper(nums, &cur, 0)
    return res
}

private func subsets_helper(_ nums: [Int], _ cur: inout [Int], _ index: Int) {
    res.append(cur)
//    if cur.count == nums.count {
//        return
//    }
    for i in index..<nums.count {
        cur.append(nums[i])
        subsets_helper(nums, &cur, i + 1)
        cur.removeLast()
    }
}
