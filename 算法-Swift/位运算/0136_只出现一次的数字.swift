//
//  0136_只出现一次的数字.swift
//  算法-Swift
//
//  Created by liang on 2021/8/22.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/single-number/
// 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。说明：你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    // 全员异或运算
    var res = 0
    for i in nums {
        res ^= i
    }
    return res
}
