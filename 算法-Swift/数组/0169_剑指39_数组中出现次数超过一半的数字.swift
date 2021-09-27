//
//  0169_剑指39_数组中出现次数超过一半的数字.swift
//  算法-Swift
//
//  Created by liang on 2021/8/19.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/majority-element/

/*
 数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。
 你可以假设数组是非空的，并且给定的数组总是存在多数元素。
 */

import Foundation

func majorityElement(_ nums: [Int]) -> Int {
    var count = 0
    var tmp = 0
    for i in 0..<nums.count {
        if count == 0 {
            tmp = nums[i]
        }
        count += (tmp == nums[i]) ? 1 : -1
    }
    return tmp
}
