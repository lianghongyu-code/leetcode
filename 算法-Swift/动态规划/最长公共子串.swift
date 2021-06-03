//
//  最长公共子串.swift
//  算法
//
//  Created by liang on 2020/9/19.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

// MARK: 一维数组
func lcs_2 (_ text1: String, _ text2: String) -> Int {
    if text1.count == 0 || text2.count == 0 {
        return 0
    }
    let arr1 = Array.init(text1)
    let arr2 = Array.init(text2)
    var minArr = arr1, maxArr = arr2
    if arr1.count > arr2.count {
        minArr = arr2
        maxArr = arr1
    }
    var res = 0
    var dp = Array.init(repeating: 0, count: minArr.count + 1)
    for i in 1...maxArr.count {
        // 在二维列表里只跟左上有关 倒序就不需要额外记录左上的值了
        for j in (1...minArr.count).reversed() {
            if maxArr[i - 1] == minArr[j - 1] {
                dp[j] = dp[j - 1] + 1
                res = max(res, dp[j])
            } else {
                dp[j] = 0 // 这里必须赋值0
            }
        }
    }
    return res
}

// MARK: 二维数组
// dp[i][j]是以arr1[i]和arr2[j]结尾的最长公共子串的长度 连续的定义
func lcs_1 (_ text1: String, _ text2: String) -> Int {
    if text1.count == 0 || text2.count == 0 {
        return 0
    }
    let arr1 = Array.init(text1)
    let arr2 = Array.init(text2)
    var res = 0
    var dp = Array.init(repeating: Array.init(repeating: 0, count: arr2.count + 1), count: arr1.count + 1)
    for i in 1...arr1.count {
        for j in 1...arr2.count {
            if arr1[i] == arr2[j] {
                dp[i][j] = dp[i - 1][j - 1] + 1
                res = max(dp[i][j], res)
            } // 这里不需要赋值0
        }
    }
    return res
}
