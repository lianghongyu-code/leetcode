//
//  0077_组合.swift
//  算法
//
//  Created by liang on 2020/9/24.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/combinations/
// 给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。

import Foundation

private var res = [[Int]]()
func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var cur = [Int]()
    combine_helper(n + 1, k, &cur, 1)
    return res
}

private func combine_helper(_ n: Int, _ k: Int, _ cur: inout [Int], _ index: Int) {
    if cur.count == k {
        res.append(cur)
        return
    }
    for i in index..<n - (k - cur.count) + 1 { // 剪枝
        cur.append(i)
        combine_helper(n, k, &cur, i + 1)
        cur.removeLast()
    }
}
