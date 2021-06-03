//
//  剑指Offer47_礼物的最大价值.swift
//  算法
//
//  Created by liang on 2020/11/14.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/

import Foundation

func maxValue(_ grid: [[Int]]) -> Int {
    var dp = Array.init(repeating: Array.init(repeating: 0, count: grid[0].count + 1), count: grid.count + 1)
    for i in 1..<dp.count {
        for j in 1..<dp[0].count {
            dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]) + grid[i - 1][j - 1]
        }
    }
    return dp.last!.last!
}
