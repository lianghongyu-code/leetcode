//
//  0496_下一个更大元素 I.swift
//  算法
//
//  Created by liang on 2020/11/8.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/next-greater-element-i/
/*
 给你两个 没有重复元素 的数组 nums1 和 nums2 ，其中nums1 是 nums2 的子集。
 请你找出 nums1 中每个元素在 nums2 中的下一个比其大的值。
 nums1 中数字 x 的下一个更大元素是指 x 在 nums2 中对应位置的右边的第一个比 x 大的元素。如果不存在，对应位置输出 -1 。
 */

import Foundation

// 单调栈
// 先找nums2中右边第一个比它大的值 再用map去匹配
func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var map = [Int: Int]()
    var res = Array.init(repeating: -1, count: nums1.count)
    var stack = [Int]()
    for i in 0..<nums2.count {
        while !stack.isEmpty && nums2[i] > stack.last! {
            map[stack.removeLast()] = nums2[i]
        }
        stack.append(nums2[i])
    }
    for i in 0..<nums1.count {
        if let tmp = map[nums1[i]] {
            res[i] = tmp
        }
    }
    return res
}
