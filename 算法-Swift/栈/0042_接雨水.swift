//
//  0042_接雨水.swift
//  算法
//
//  Created by liang on 2020/11/11.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/trapping-rain-water/
/*
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
 */

import Foundation

func trap(_ height: [Int]) -> Int {

    var res = 0
    // 栈存下标
    var stack = [Int]()

    // 单调递减
    for i in 0..<height.count {
        // 栈为空或当前值小于等于栈顶值就入栈
        while !stack.isEmpty && height[i] > height[stack.last!] {
            let top = stack.removeLast()
            if stack.isEmpty {
                break
            }
            // 宽 * 高  高 = 两边高度较小者 - 中间的高度
            res += (i - stack.last! - 1) * (min(height[i], height[stack.last!]) - height[top])
        }
        stack.append(i)
    }
    return res
}
