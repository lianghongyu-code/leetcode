//
//  面试题16.16_部分排序.swift
//  算法
//
//  Created by liang on 2020/10/18.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/sub-sort-lcci/

import Foundation

func subSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 {
        return [-1, -1]
    }
    
    // 找逆序对
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
