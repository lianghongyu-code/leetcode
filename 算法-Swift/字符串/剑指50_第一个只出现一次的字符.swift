//
//  File.swift
//  算法-Swift
//
//  Created by liang on 2021/8/22.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof/
// 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。

import Foundation

func firstUniqChar(_ s: String) -> Character {
    let arr = Array.init(s)
    var dic = [Character: Int]()
    for c in arr {
        if dic.keys.contains(c) {
            dic[c]! += 1
        } else {
            dic[c] = 1
        }
    }
    for c in arr {
        if dic[c] == 1 {
            return c
        }
    }
    return " "
    
    // 26个字母
//    var countArray = [Int](repeating: 0, count: 26)
//    for char in s {
//        countArray[Int(char.asciiValue!)-97] += 1
//    }
//    for char in s {
//        if countArray[Int(char.asciiValue!)-97] == 1 {
//            return char
//        }
//    }
//    return Character(" ")
}
