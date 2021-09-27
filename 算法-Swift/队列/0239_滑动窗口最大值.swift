//
//  0239_滑动窗口最大值.swift
//  算法
//
//  Created by liang on 2020/10/25.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/sliding-window-maximum/
/*
 给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。
 返回滑动窗口中的最大值。
 */

import Foundation

// 双端队列
func maxSlidingWindow1(_ nums: [Int], _ k: Int) -> [Int] {
    if nums.count == 0 || k < 1 {
        return []
    }
    var res = [Int]()
    var deque = [Int]()
    for i in 0..<nums.count {
        while !deque.isEmpty && nums[i] >= nums[deque.last!] {
            deque.removeLast()
        }
        deque.append(i)
        let j = i - k + 1
        if j > 0 {
            if deque.first! < j {
                deque.removeFirst()
            }
            res.append(nums[deque.first!])
        }
    }
    return res
}
