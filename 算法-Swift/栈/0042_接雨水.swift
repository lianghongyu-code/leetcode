//
//  0042_接雨水.swift
//  算法
//
//  Created by liang on 2020/11/11.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/trapping-rain-water/

import Foundation

func trap(_ height: [Int]) -> Int {
    
    
    // 练习
    var stack = [Int]()
    var res = 0
    
    for i in 0..<height.count {
        while !stack.isEmpty && height[i] > height[stack.last!] {
            let top = stack.removeLast()
            if stack.isEmpty {
                break
            }
            res += (i - stack.last! - 1) * (min(height[i], height[stack.last!]) - height[top])
        }
        stack.append(i)
    }
    
    return res
    

//    var res = 0
//    var stack = [Int]()
//
//    // 单调递减
//    for i in 0..<height.count {
//        while !stack.isEmpty && height[i] > height[stack.last!] {
//            let top = stack.removeLast()
//            if stack.isEmpty {
//                break
//            }
//            // 宽 * 高  高 = 两边高度较小者 - 中间的高度
//            res += (i - stack.last! - 1) * (min(height[i], height[stack.last!]) - height[top])
//        }
//        stack.append(i)
//    }
//    return res
}
