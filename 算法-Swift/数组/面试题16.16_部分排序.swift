//
//  面试题16.16_部分排序.swift
//  算法
//
//  Created by liang on 2020/10/18.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/sub-sort-lcci/
/*
 给定一个整数数组，编写一个函数，找出索引m和n，只要将索引区间[m,n]的元素排好序，整个数组就是有序的。
 注意：n-m尽量最小，也就是说，找出符合条件的最短序列。函数返回值为[m,n]，若不存在这样的m和n（例如整个数组是有序的），请返回[-1,-1]。
 */

import Foundation

// 技巧: 找逆序对
func subSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 {
        return [-1, -1]
    }
    
    var max = array.first!
    var maxIndex = -1
    for i in 1..<array.count {
        if array[i] >= max {
            max = array[i]
        } else {
            maxIndex = i
        }
    }
    
    var min = array.last!
    var minIndex = -1
    for i in (0..<array.count - 1).reversed() {
        if array[i] <= min {
            min = array[i]
        } else {
            minIndex = i
        }
    }
    
    return [minIndex, maxIndex]
}
