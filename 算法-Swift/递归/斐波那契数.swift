//
//  斐波那契数.swift
//  算法
//
//  Created by liang on 2020/6/14.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/fibonacci-number/

import Foundation

// 0 1 1 2 3 5 8 13 21

func fib(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    
    // 递归
//    return fib(n - 1) + fib(n - 2)
    
    // 迭代
    var first = 0
    var second = 1
    for _ in 0..<n-1 { // 第n个要加n-1次
        second = first + second
        first = second - first
    }
    return second // 最后的结果是second
}
