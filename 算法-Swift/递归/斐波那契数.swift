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


// 练习
func fib(_ n: Int) -> Int {
    return 0
}







// 递归
func fib1(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    
    return fib1(n - 1) + fib1(n - 2)
}
//print(fib1(40))

// 迭代
func fib2(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }

    var first = 0
    var second = 1
    for _ in 0..<n-1 { // 第n个要加n-1次
        let sum = first + second
        first = second
        second = sum
    }
    return second // 最后的结果是second
}
//print(fib2(40))
