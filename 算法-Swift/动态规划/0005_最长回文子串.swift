//
//  0005_最长回文子串.swift
//  算法
//
//  Created by liang on 2020/11/21.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/longest-palindromic-substring/

import Foundation

func longestPalindrome(_ s: String) -> String {
    if s.count <= 1 {
        return s
    }
    let sArr = Array(s)
    var first = 0
    var maxLength = 1
    var dp = Array.init(repeating: Array.init(repeating: false, count: s.count), count: s.count)
    // 从左到右 从下到上
    for i in (0..<s.count).reversed() {
        for j in i..<s.count {
            let length = j - i + 1
            dp[i][j] = (sArr[i] == sArr[j]) && (length <= 2 || dp[i + 1][j - 1])
            if dp[i][j] == true && length > maxLength {
                maxLength = length
                first = i
            }
        }
    }
    return String(sArr[first..<first + maxLength])
}
