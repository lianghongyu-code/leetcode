//
//  0041_缺失的第一个正数.swift
//  算法
//
//  Created by liang on 2020/9/30.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/first-missing-positive/
// 给你一个未排序的整数数组，请你找出其中没有出现的最小的正整数。

import Foundation

func firstMissingPositive(_ nums: [Int]) -> Int {
    var nums = nums
    for i in 0..<nums.count {
        while nums[i] > 0 && nums[i] - 1 < nums.count && nums[i] != nums[nums[i] - 1] {
            (nums[i], nums[nums[i] - 1]) = (nums[nums[i] - 1], nums[i])
        }
    }
    for i in 0..<nums.count {
        if nums[i] != i + 1 {
            return i + 1
        }
    }
    return nums.count + 1
}

// contains已经是O(n)了 不符合
func firstMissingPositive_1(_ nums: [Int]) -> Int {
    for i in 0..<nums.count {
        if nums.contains(i + 1) {
            continue
        }
        return i + 1
    }
    return nums.count + 1
}

// sort是O(nlogn) 不符合
func firstMissingPositive_2(_ nums: [Int]) -> Int {
    let newNums = nums.sorted()
    var res = 1
    for i in 0..<newNums.count {
        if newNums[i] == res {
            res += 1
        }
        if newNums[i] > res {
            return res
        }
    }
    return res
}
