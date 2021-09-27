//
//  263_丑数.swift
//  算法-Swift
//
//  Created by liang on 2021/7/7.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/ugly-number/
// 给你一个整数 n ，请你判断 n 是否为 丑数 。如果是，返回 true ；否则，返回 false 。丑数 就是只包含质因数 2、3 和/或 5 的正整数。

import Foundation

func isUgly(_ n: Int) -> Bool {
    if n <= 0 {
        return false
    }
    let arr = [2, 3, 5]
    var n = n
    for i in 0..<arr.count {
        while n % arr[i] == 0 {
            n = n / arr[i]
        }
    }
    return n == 1
}
