//
//  0239_滑动窗口最大值.swift
//  算法
//
//  Created by liang on 2020/10/25.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/sliding-window-maximum/

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
