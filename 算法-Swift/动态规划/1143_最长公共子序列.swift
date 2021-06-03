//
//  最长公共子序列.swift
//  算法
//
//  Created by liang on 2020/8/11.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/longest-common-subsequence/

import Foundation

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    
    return longestCommonSubsequence_5(text1, text2)
}


// MARK: 一维数组 优化
private func longestCommonSubsequence_5(_ text1: String, _ text2: String) -> Int {
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
    
    var dp = Array.init(repeating: 0, count: minArr.count + 1)
    for i in 1...maxArr.count {
        var cur = 0
        for j in 1...minArr.count {
            let leftTop = cur
            cur = dp[j]
            if maxArr[i - 1] == minArr[j - 1] {
                dp[j] = leftTop + 1
            } else {
                dp[j] = max(dp[j - 1], dp[j])
            }
        }
    }
    print(dp)
    return dp[minArr.count]
}


// MARK: 一维数组
private func longestCommonSubsequence_4(_ text1: String, _ text2: String) -> Int {
    if text1.count == 0 || text2.count == 0 {
        return 0
    }
    let arr1 = Array.init(text1)
    let arr2 = Array.init(text2)
    
    var dp = Array.init(repeating: 0, count: arr2.count + 1)
    for i in 1...arr1.count {
        var cur = 0
        for j in 1...arr2.count {
            let leftTop = cur
            cur = dp[j]
            if arr1[i - 1] == arr2[j - 1] {
                dp[j] = leftTop + 1
            } else {
                dp[j] = max(dp[j - 1], dp[j])
            }
        }
    }
    print(dp)
    return dp[arr2.count]
}


// MARK: 滚动数组
private func longestCommonSubsequence_3(_ text1: String, _ text2: String) -> Int {
    if text1.count == 0 || text2.count == 0 {
        return 0
    }
    let arr1 = Array.init(text1)
    let arr2 = Array.init(text2)
    
    var dp = Array.init(repeating: Array.init(repeating: 0, count: arr2.count + 1), count: 2)
    for i in 1...arr1.count {
        let cur = i % 2 // % 2 = & 1
        let pre = (i - 1) % 2
        for j in 1...arr2.count {
            if arr1[i - 1] == arr2[j - 1] {
                dp[cur][j] = dp[pre][j - 1] + 1
            } else {
                dp[cur][j] = max(dp[cur][j - 1], dp[pre][j])
            }
        }
    }
    print(dp)
    return dp[arr1.count % 2][arr2.count]
}


// MARK: 二维数组
// dp[i][j]是arr1前i个元素和arr2前j个元素的最长公共子序列的长度 不连续的定义 比较可选的最后一个
private func longestCommonSubsequence_2(_ text1: String, _ text2: String) -> Int {
    if text1.count == 0 || text2.count == 0 {
        return 0
    }
    let arr1 = Array.init(text1)
    let arr2 = Array.init(text2)
    var dp = Array.init(repeating: Array.init(repeating: 0, count: arr2.count + 1), count: arr1.count + 1)
    for i in 1...arr1.count {
        for j in 1...arr2.count {
            if arr1[i - 1] == arr2[j - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1
            } else {
                dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
            }
        }
    }
    print(dp)
    return dp[arr1.count][arr2.count]
}


// MARK: 递归 时间复杂度O(2^n)
private func longestCommonSubsequence_1(_ text1: String, _ text2: String) -> Int {
    if text1.count == 0 || text2.count == 0 {
        return 0
    }
    let arr1 = Array.init(text1)
    let arr2 = Array.init(text2)
    
    return longestCommonSubsequence_helper(arr1, text1.count, arr2, text2.count)
}

private func longestCommonSubsequence_helper(_ arr1: [Character], _ length1: Int, _ arr2: [Character], _ length2: Int) -> Int {
    if length1 == 0 || length2 == 0 {
        return 0
    }
    if arr1[length1 - 1] == arr2[length2 - 1] {
        return longestCommonSubsequence_helper(arr1, length1 - 1, arr2, length2 - 1) + 1
    } else {
        return max(longestCommonSubsequence_helper(arr1, length1 - 1, arr2, length2), longestCommonSubsequence_helper(arr1, length1, arr2, length2 - 1))
    }
}
