//
//  0-1背包.swift
//  算法
//
//  Created by liang on 2020/8/17.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

// 练习
func backPack(_ values: [Int], _ weights:[Int], _ capacity: Int) -> Int {
    
    if values.count == 0 || weights.count == 0 || capacity == 0 || values.count != weights.count {
        return 0
    }
    
    
    
    return 0
}







// MARK: 恰好装满
func backPack_4(_ values: [Int], _ weights:[Int], _ capacity: Int) -> Int {
    if values.count == 0 || weights.count == 0 || capacity == 0 || values.count != weights.count {
        return 0
    }
    var dp = Array.init(repeating: Int.min, count: capacity + 1)
    dp[0] = 0
    for i in 1...values.count {
        for j in (weights[i - 1]...capacity).reversed() {
            dp[j] = max(dp[j], values[i - 1] + dp[j - weights[i - 1]])
        }
    }
    // 定义无法凑到恰好装满返回-1
    return dp[capacity] < 0 ? -1 : dp[capacity]
}

// MARK: 一维数组优化
func backPack_3(_ values: [Int], _ weights:[Int], _ capacity: Int) -> Int {
    if values.count == 0 || weights.count == 0 || capacity == 0 || values.count != weights.count {
        return 0
    }
    var dp = Array.init(repeating: 0, count: capacity + 1)
    for i in 1...values.count {
        for j in (weights[i - 1]...capacity).reversed() {
            dp[j] = max(dp[j], values[i - 1] + dp[j - weights[i - 1]])
        }
    }
    return dp[capacity]
}

// MARK: 一维数组
func backPack_2(_ values: [Int], _ weights:[Int], _ capacity: Int) -> Int {
    if values.count == 0 || weights.count == 0 || capacity == 0 || values.count != weights.count {
        return 0
    }
    var dp = Array.init(repeating: 0, count: capacity + 1)
    for i in 1...values.count {
        for j in (1...capacity).reversed() { // 只跟上一排有关 j倒序不需要处理其他的
            if j >= weights[i - 1] {
                dp[j] = max(dp[j], values[i - 1] + dp[j - weights[i - 1]])
            }
        }
    }
    return dp[capacity]
}

// MARK: 二维数组
// dp[i][j]代表在前i件物品里选最大重量为j时的最大价值 不连续的定义 比较可选的最后一件
func backPack_1(_ values: [Int], _ weights:[Int], _ capacity: Int) -> Int {
    if values.count == 0 || weights.count == 0 || capacity == 0 || values.count != weights.count {
        return 0
    }
    var dp = Array.init(repeating: Array.init(repeating: 0, count: capacity + 1), count: values.count + 1)
    
    for i in 1...values.count {
        for j in 1...capacity {
            if j < weights[i - 1] {
                dp[i][j] = dp[i - 1][j]
            } else {
                dp[i][j] = max(dp[i - 1][j], values[i - 1] + dp[i - 1][j - weights[i - 1]])
            }
        }
    }
    return dp[values.count][capacity]
}
