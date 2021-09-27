//
//  0062_不同路径.swift
//  算法
//
//  Created by liang on 2020/9/7.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/unique-paths/

import Foundation

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    
    // 一维数组
    let min = m < n ? m : n
    let max = min == m ? n : m
    var dp = Array.init(repeating: 0, count: min + 1)
    for i in 1...max {
        for j in 1...min {
            if i == 1 || j == 1 {
                dp[j] = 1
            } else {
                dp[j] = dp[j] + dp[j - 1]
            }
        }
    }
    return dp[min]
    
    // 二维数组
//    var dp = Array.init(repeating: Array.init(repeating: 0, count: m + 1), count: n + 1)
//    for i in 1...n {
//        for j in 1...m {
//            // || 和 && 都可以 思路不同
//            if i == 1 || j == 1 {
//                dp[i][j] = 1
//            } else {
//                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
//            }
//        }
//    }
//    return dp[n][m]
}
