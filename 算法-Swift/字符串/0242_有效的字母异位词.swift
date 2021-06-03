//
//  0242_有效的字母异位词.swift
//  算法
//
//  Created by liang on 2020/11/11.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/valid-anagram/

import Foundation

// 解法一: 排序后比较是否相同
// 解法二: 哈希表 字母为key 次数为value
// 解法三: 题目小写字母 创建长度为26的数组 (字母ASCII码值 - 'a')为index 次数为value
func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    if s == t {
        return true
    }
    var res = Array.init(repeating: 0, count: 26)
    let sArr = Array.init(s)
    let tArr = Array.init(t)
    let a_ascii = Character("a").asciiValue!
    
    for ch in sArr {
        res[Int(ch.asciiValue! - a_ascii)] += 1
    }
    
    for ch in tArr {
        res[Int(ch.asciiValue! - a_ascii)] -= 1
        if res[Int(ch.asciiValue! - a_ascii)] < 0 {
            return false
        }
    }
    
    return true
}
