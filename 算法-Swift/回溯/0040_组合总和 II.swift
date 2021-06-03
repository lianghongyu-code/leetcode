//
//  0040_组合总和 II.swift
//  算法
//
//  Created by liang on 2020/9/24.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/combination-sum-ii/

import Foundation

private var res = [[Int]]()
func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    if candidates.count == 0 {
        return []
    }
    var cur = [Int]()
    let newCandidates = candidates.sorted()
    combinationSum2_helper(newCandidates, target, &cur, 0)
    return res
}

private func combinationSum2_helper(_ candidates: [Int], _ target: Int, _ cur: inout [Int], _ index: Int) {
    if target < 0 {
        return
    }
    if target == 0 {
        res.append(cur)
        return
    }
    
    for i in index..<candidates.count {
        if candidates[i] <= target {
            if i > index && candidates[i] == candidates[i - 1] {
                continue
            }
            cur.append(candidates[i])
            combinationSum2_helper(candidates, target - candidates[i], &cur, i + 1)
            cur.removeLast()
        } else {
            return
        }
    }
}
