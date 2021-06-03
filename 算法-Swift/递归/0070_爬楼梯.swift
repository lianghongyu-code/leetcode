//
//  爬楼梯.swift
//  算法
//
//  Created by liang on 2020/8/1.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/climbing-stairs/

import Foundation

func climbStairs(_ n: Int) -> Int {
    
    if n <= 1 {
        return n
    }
    
    // 递归
//    return climbStairs(n-1) + climbStairs(n-2)
    
    //
    var first = 1;
    var second = 2
    for _ in 0..<n-2 { // 前两种情况是1和2  
        second = first + second
        first = second - first
    }
    return second
}
