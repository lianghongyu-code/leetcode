//
//  最大连续子序和.swift
//  算法
//
//  Created by liang on 2020/8/6.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

// https://leetcode-cn.com/problems/maximum-subarray/

// MARK: 动态规划 空间复杂度O(n)
func maxSubArray1(_ nums: [Int]) -> Int {
    // dp[i]是以nums[i]结尾的最大子序和
    var dp = Array.init(repeating: 0, count: nums.count)
    dp[0] = nums[0]
    var res = dp[0]
    for i in 1..<nums.count {
        //        if dp[i - 1] < 0 {
        //            dp[i] = nums[i]
        //        } else {
        //            dp[i] = dp[i - 1] + nums[i]
        //        }
        dp[i] = nums[i] + max(dp[i - 1], 0) // 合成一句
        res = max(res, dp[i])
    }
    return res
}

// MARK: 动态规划 优化 空间复杂度优化成O(1) 贪心
func maxSubArray2(_ nums: [Int]) -> Int {
    // dp记录以某一个数结尾的最大子序和 因为之和前一个dp有关 所以可以替换
    // res记录历史dp中的最大值
    var dp = nums[0]
    var res = dp
    for i in 1..<nums.count {
        dp = nums[i] + max(dp, 0)
        res = max(res, dp)
    }
    return res
}

// MARK: 分治
func maxSubArray(_ nums: [Int]) -> Int {
    return maxSubArray_helper(nums, 0, nums.count)
}

// 左闭右开 越界
private func maxSubArray_helper(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
    if (right - left) < 2 {
        return nums[left]
    }

    let middle = (left + right) >> 1

    // 范围跨middle 左边从middle向左 右边从middle向右 再相加
    var leftMax = nums[middle]
    var leftSum = leftMax
    for i in (left...middle - 1).reversed() {
        leftSum += nums[i]
        leftMax = max(leftMax, leftSum)
    }
    var rightMax = nums[middle]
    var rightSum = rightMax
    for i in middle + 1..<right {
        rightSum += nums[i]
        rightMax = max(rightMax, rightSum)
    }

    // 范围在左边和在右边
    return max(leftMax + rightMax, max(maxSubArray_helper(nums, left, middle), maxSubArray_helper(nums, middle, right)))
}
