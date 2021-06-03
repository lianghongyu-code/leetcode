//
//  检测大写字母.swift
//  算法
//
//  Created by liang on 2020/8/1.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/detect-capital/
/*
 全部字母都是大写，比如"USA"。
 单词中所有字母都不是大写，比如"leetcode"。
 如果单词不只含有一个字母，只有首字母大写， 比如 "Google"。
 */

import Foundation

func detectCapitalUse(_ word: String) -> Bool {
    // 统计大写字母的个数 个数只有3种情况: 0, 1并为首字母, 全部
    var upCount = 0;
    for char in word {
        if char.isUppercase {
            upCount += 1
        }
    }
    switch upCount {
    case 0:
        return true
    case 1:
        return word.first!.isUppercase
    case word.count:
        return true
    default:
        return false
    }
}
