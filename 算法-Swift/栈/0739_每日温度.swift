//
//  0739_每日温度.swift
//  算法
//
//  Created by liang on 2020/11/2.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/daily-temperatures/

import Foundation

// 求右边第一个比它大的值
// 单调栈 时间复杂度O(N)每个元素入栈出栈一次 空间复杂度O(N)栈空间
func dailyTemperatures(_ T: [Int]) -> [Int] {
    if T.count == 0 {
        return []
    }
    var res = Array.init(repeating: 0, count: T.count)
    var stack = [Int]()
    for i in 0..<T.count {
        while !stack.isEmpty && T[i] > T[stack.last!] {
            res[stack.last!] = i - stack.last!
            stack.removeLast()
        }
        stack.append(i)
    }
    return res
}
