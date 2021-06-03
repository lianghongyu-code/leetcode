//
//  0496_下一个更大元素 I.swift
//  算法
//
//  Created by liang on 2020/11/8.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/next-greater-element-i/

import Foundation

// 单调栈
// 存值
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
