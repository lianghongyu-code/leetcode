//
//  0072_编辑距离.swift
//  算法
//
//  Created by liang on 2020/11/15.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/edit-distance/

import Foundation

func minDistance(_ word1: String, _ word2: String) -> Int {
    let arr1 = Array.init(word1)
    let arr2 = Array.init(word2)
    let lengh1 = arr1.count
    let lengh2 = arr2.count
    if lengh1 == 0 {
        return lengh2
    }
    if lengh2 == 0 {
        return lengh1
    }
    var dp = Array.init(repeating: Array.init(repeating: 0, count: lengh2 + 1), count: lengh1 + 1)
    for i in 1..<lengh1 + 1 {
        dp[i][0] = i
    }
    for i in 1..<lengh2 + 1 {
        dp[0][i] = i
    }
    for i in 1..<lengh1 + 1 {
        for j in 1..<lengh2 + 1 {
            if arr1[i - 1] == arr2[j - 1] {
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
            }
//            let top = dp[i - 1][j] + 1 // 删除操作
//            let left = dp[i][j - 1] + 1 // 插入操作
//            var leftTop = dp[i - 1][j - 1] // 替换操作 最后一个字符相同
//            if arr1[i - 1] != arr2[j - 1] { // 最后一个字符不同
//                leftTop += 1
//            }
//            dp[i][j] = min(top, left, leftTop)
        }
    }
    return dp[lengh1][lengh2]
}
