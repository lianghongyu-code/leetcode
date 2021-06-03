//
//  0047_全排列 II.swift
//  算法
//
//  Created by liang on 2020/9/24.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/permutations-ii/

import Foundation

private var res = [[Int]]()
func permuteUnique(_ nums: [Int]) -> [[Int]] {
    if nums.count == 0 {
        return res
    }
    
    let newNums = nums.sorted()
    var used = Array.init(repeating: false, count: nums.count)
    var cur = [Int]()
    permuteUnique_helper(newNums, &cur, &used)
    return res
}

private func permuteUnique_helper(_ nums: [Int], _ cur: inout [Int], _ used: inout [Bool]) {
    if nums.count == cur.count {
        res.append(cur)
        return
    }
    
    for i in 0..<nums.count {
        // 剪枝
        if used[i] == true || (i > 0 && nums[i] == nums[i - 1] && used[i - 1] == false) {
            continue
        }
        used[i] = true
        cur.append(nums[i])
        permuteUnique_helper(nums, &cur, &used)
        used[i] = false
        cur.removeLast()
    }
}
