//
//  0039_组合总和.swift
//  算法
//
//  Created by liang on 2020/9/24.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/combination-sum/

import Foundation

private var res = [[Int]]()
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    if candidates.count == 0 {
        return []
    }
    let newCandidates = candidates.sorted()
    var cur = [Int]()
    combinationSum_helper(newCandidates, target, &cur, 0)
    return res
}

private func combinationSum_helper(_ candidates: [Int], _ target: Int, _ cur: inout [Int], _ index: Int) {
    if target < 0 {
        return
    }
    if target == 0 {
        res.append(cur)
        return
    }
    
    for i in index..<candidates.count {
        if candidates[i] <= target {
            cur.append(candidates[i])
            combinationSum_helper(candidates, target - candidates[i], &cur, i)
            cur.removeLast()
        } else {
            return
        }
    }
}

// 排列问题，讲究顺序（即 [2, 2, 3] 与 [2, 3, 2] 视为不同列表时），需要记录哪些数字已经使用过，此时用 used 数组；
// 组合问题，不讲究顺序（即 [2, 2, 3] 与 [2, 3, 2] 视为相同列表时），需要按照某种顺序搜索，此时使用 begin 变量。
