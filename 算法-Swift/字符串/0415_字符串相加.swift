//
//  0415_字符串相加.swift
//  算法-Swift
//
//  Created by liang on 2021/7/20.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/add-strings/
// 给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和。

import Foundation

func addStrings(_ num1: String, _ num2: String) -> String {
    let arr1 = Array.init(num1)
    let arr2 = Array.init(num2)
    var tmp = 0
    var res = String()
    let max = max(num1.count, num2.count)
    let p1 = num1.count - 1
    let p2 = num2.count - 1
    for i in 0..<max {
        let sum1 = p1 - i >= 0 ? Int(String(arr1[p1 - i]))! : 0
        let sum2 = p2 - i >= 0 ? Int(String(arr2[p2 - i]))! : 0
        let sum = sum1 + sum2 + tmp
        res.insert(contentsOf: String(sum % 10), at: res.startIndex)
        tmp = sum >= 10 ? 1 : 0
    }
    if tmp == 1 {
        res.insert(contentsOf: String(tmp), at: res.startIndex)
    }
    return res
}
