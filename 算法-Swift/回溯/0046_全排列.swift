//
//  全排列.swift
//  算法
//
//  Created by liang on 2020/8/2.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/permutations/
// 给定一个 没有重复 数字的序列，返回其所有可能的全排列

import Foundation

private var res = [[Int]]()
func permute(_ nums: [Int]) -> [[Int]] {
    if nums.count == 0 {
        return res
    }
    
    var cur = [Int]()
    var used = Array.init(repeating: false, count: nums.count)
    permute_helper(nums, &cur, &used)
    return res
}

private func permute_helper(_ nums: [Int], _ cur: inout [Int], _ used: inout [Bool]) {
    if cur.count == nums.count {
        res.append(cur)
        return
    }
    
    for i in 0..<nums.count {
        if used[i] == true { // 剪枝
            continue
        }
        used[i] = true
        cur.append(nums[i])
        permute_helper(nums, &cur, &used)
        used[i] = false // 回溯
        cur.removeLast()
    }
}
