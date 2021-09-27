//
//  0033_搜索旋转排序数组.swift
//  算法-Swift
//
//  Created by liang on 2021/7/21.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/search-in-rotated-sorted-array/
/*
 整数数组 nums 按升序排列，数组中的值 互不相同 。
 在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。
 给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。
 */

import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    return search_helper(nums, 0, nums.count - 1, target)
}

func search_helper(_ nums: [Int], _ begin: Int, _ end: Int, _ target: Int) -> Int {
    if begin > end {
        return -1
    }
//    let mid = (begin + end) >> 1
    let mid = begin + (end - begin) / 2
    if nums[begin] == target {
        return begin
    }
    if nums[mid] == target {
        return mid
    }
    if nums[end] == target {
        return end
    }
    // 左半有序
    if nums[begin] < nums[mid] {
        // 在左半里
        if target > nums[begin] && target < nums[mid] {
            return search_helper(nums, begin + 1, mid - 1, target)
        }
        // 在右半里
        else {
            return search_helper(nums, mid + 1, end - 1, target)
        }
    }
    // 右半有序
    else {
        // 在右半里
        if target > nums[mid] && target < nums[end] {
            return search_helper(nums, mid + 1, end - 1, target)
        }
        // 在左半里
        else {
            return search_helper(nums, begin + 1, mid - 1, target)
        }
    }
}
