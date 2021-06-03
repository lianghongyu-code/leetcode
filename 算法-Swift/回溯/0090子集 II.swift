//
//  0090子集 II.swift
//  算法
//
//  Created by liang on 2020/9/26.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/subsets-ii/
// 给定一个可能包含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

import Foundation

private var res = [[Int]]()
func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    let newNums = nums.sorted()
    var cur = [Int]()
    subsetsWithDup_helper(newNums, &cur, 0)
    return res
}

private func subsetsWithDup_helper(_ nums: [Int], _ cur: inout [Int], _ index: Int) {
    res.append(cur)
    for i in index..<nums.count {
        if i > index && nums[i] == nums[i - 1] {
            continue
        }
        cur.append(nums[i])
        subsetsWithDup_helper(nums, &cur, i + 1)
        cur.removeLast()
    }
}


