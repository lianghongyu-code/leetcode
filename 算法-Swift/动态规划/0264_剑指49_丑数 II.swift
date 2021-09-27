//
//  剑指49_丑数.swift
//  算法-Swift
//
//  Created by liang on 2021/7/7.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/chou-shu-lcof/
// 我们把只包含质因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到大的顺序的第 n 个丑数。

import Foundation

func nthUglyNumber(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    var dp = Array.init(repeating: 0, count: n)
    dp[0] = 1
    var a = 0, b = 0, c = 0
    for i in 1..<n {
        let n2 = dp[a] * 2
        let n3 = dp[b] * 3
        let n5 = dp[c] * 5
        dp[i] = min(n2, n3, n5)
        if dp[i] == n2 {
            a += 1
        }
        if dp[i] == n3 {
            b += 1
        }
        if dp[i] == n5 {
            c += 1
        }
    }
    return dp[n - 1]
}
