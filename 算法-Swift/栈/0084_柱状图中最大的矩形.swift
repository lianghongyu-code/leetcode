//
//  0084_柱状图中最大的矩形.swift
//  算法
//
//  Created by liang on 2020/11/9.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/largest-rectangle-in-histogram/

import Foundation

// 精简
func largestRectangleArea(_ heights: [Int]) -> Int {
    
    // 练习
    var left = Array.init(repeating: -1, count: heights.count)
    var right = Array.init(repeating: heights.count, count: heights.count)
    
    var stack = [Int]()
    for i in 0..<heights.count {
        while !stack.isEmpty && heights[i] <= heights[stack.last!] {
            right[stack.last!] = i
            stack.removeLast()
        }
        left[i] = stack.isEmpty ? -1 : stack.last!
        stack.append(i)
    }
    
    var res = 0
    for i in 0..<heights.count {
        res = max(res, (right[i] - left[i] - 1) * heights[i])
    }
    
    return res
    
    
    
  
    
//    var left = Array.init(repeating: -1, count: heights.count)
//    var right = Array.init(repeating: heights.count, count: heights.count)
//    var stack = [Int]()
//
//    for i in 0..<heights.count {
//        while !stack.isEmpty && heights[i] <= heights[stack.last!] {
//            right[stack.last!] = i
//            stack.removeLast()
//        }
//        left[i] = stack.isEmpty ? -1 : stack.last!
//        stack.append(i)
//    }
//
//    var res = 0
//    for i in 0..<heights.count {
//        res = max(res, (right[i] - left[i] - 1) * heights[i])
//    }
//
//    return res
}

// 过程
// 从左到右单调栈求左边界
// 从右到左单调栈求右边界
// 相减得宽 再乘高
func largestRectangleArea0(_ heights: [Int]) -> Int {
    //    [6,7,5,2,4,5,9,3]
    // [-1,0,1,2,3,4,5,6,7,count]
    // -1和count是高度为0哨兵
    var left = Array.init(repeating: -1, count: heights.count)
    var right = Array.init(repeating: heights.count, count: heights.count)
    var stack = [Int]()
    
    // [−1,0,−1,−1,3,4,5,3]
    // 单调递增
    for i in 0..<heights.count {
        while !stack.isEmpty && heights[i] <= heights[stack.last!] {
            stack.removeLast()
        }
        left[i] = stack.isEmpty ? -1 : stack.last!
        stack.append(i)
    }
    print(left)
    
    stack.removeAll()
    
    // [2,2,3,8,7,7,7,8]
    // 单调递增
    for i in (0..<heights.count).reversed() {
        while !stack.isEmpty && heights[i] <= heights[stack.last!] {
            stack.removeLast()
        }
        right[i] = stack.isEmpty ? heights.count : stack.last!
        stack.append(i)
    }
    print(right)
    
    var res = 0
    for i in 0..<heights.count {
        res = max(res, (right[i] - left[i] - 1) * heights[i])
    }
    
    return res
}
