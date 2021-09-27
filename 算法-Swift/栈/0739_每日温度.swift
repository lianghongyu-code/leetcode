//
//  0739_每日温度.swift
//  算法
//
//  Created by liang on 2020/11/2.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/daily-temperatures/
/*
 请根据每日气温列表，重新生成一个列表。对应位置的输出为：要想观测到更高的气温，至少需要等待的天数。如果气温在这之后都不会升高，请在该位置用 0 来代替。
 例如，给定一个列表 temperatures = [73, 74, 75, 71, 69, 72, 76, 73]，你的输出应该是 [1, 1, 4, 2, 1, 1, 0, 0]。
 */

import Foundation

// 题意可简化为求右边第一个比它大的值
// 单调栈 单调递减 时间复杂度O(N)每个元素入栈出栈一次 空间复杂度O(N)栈空间
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
