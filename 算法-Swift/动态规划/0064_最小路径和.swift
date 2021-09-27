//
//  0064_最小路径和.swift
//  算法-Swift
//
//  Created by liang on 2021/7/19.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/minimum-path-sum/
// 给定一个包含非负整数的 m x n 网格 grid ，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
// 说明：每次只能向下或者向右移动一步。

import Foundation

func minPathSum(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    if m == 0 || n == 0 {
        return 0
    }
    var dp = Array.init(repeating: Array.init(repeating: 0, count: n), count: m)
    for i in 0..<m {
        for j in 0..<n {
            if i == 0 && j == 0 {
                dp[i][j] = grid[0][0]
            } else if i == 0 {
                dp[i][j] = dp[i][j - 1] + grid[i][j]
            } else if j == 0 {
                dp[i][j] = dp[i - 1][j] + grid[i][j]
            } else {
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
            }
        }
    }
    return dp[m - 1][n - 1]
}
