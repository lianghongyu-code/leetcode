//
//  0343_整数拆分.swift
//  算法-Swift
//
//  Created by liang on 2021/7/31.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/integer-break/
// 给定一个正整数 n，将其拆分为至少两个正整数的和，并使这些整数的乘积最大化。 返回你可以获得的最大乘积。

import Foundation

func integerBreak(_ n: Int) -> Int {
    var dp = Array.init(repeating: 0, count: n + 1)
    for i in 2...n {
        var tmp = 0
        for j in 1..<i {
            tmp = max(tmp, max(j * (i - j), j * dp[i - j])) // 不拆和拆的最大值
        }
        dp[i] = tmp
    }
    return dp[n]
}
