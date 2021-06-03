//
//  面试题01.09_字符串轮转.swift
//  算法
//
//  Created by liang on 2020/11/5.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/string-rotation-lcci/

import Foundation

// 拼接s1+s1 看s2是否为其子串
func isFlipedString(_ s1: String, _ s2: String) -> Bool {
    if s1.count != s2.count {
        return false
    }
    if s1 == s2 {
        return true
    }
    return (s1 + s1).contains(s2)
}
