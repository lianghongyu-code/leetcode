//
//  最长上升子序列.swift
//  算法
//
//  Created by liang on 2020/8/9.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/longest-increasing-subsequence/

import Foundation

func lengthOfLIS(_ nums: [Int]) -> Int {
    if  nums.count == 0 {
        return 0
    }
    
    // 练习
    
    
    
    
    
    
    
    
    
    // MARK: 动态规划 空间复杂度O(n) 时间复杂度O(n^2)
    // dp[i]是以nums[i]结尾的最长上升子序列的长度 连续的定义
    // 遍历i前面的nums 如果可添加则dp[j]+1
    var dp = Array.init(repeating: 1, count: nums.count)
    for i in 1..<nums.count {
        var maxTemp = 0
        for j in 0..<i {
            if nums[i] > nums[j] {
                maxTemp = max(maxTemp, dp[j])
            }
        }
        dp[i] = maxTemp + 1
    }

    return dp.max()!
    
//    var dp = Array.init(repeating: 1, count: nums.count)
//    var maxTemp = 1
//    for i in 1..<nums.count {
//        for j in 0..<i {
//            if nums[i] > nums[j] {
//                dp[i] = max(dp[i], dp[j] + 1)
//            }
//        }
//        maxTemp = max(dp[i], maxTemp)
//    }
//
//    return maxTemp
}
