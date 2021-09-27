//
//  findK.swift
//  算法-Swift
//
//  Created by liang on 2021/8/26.
//  Copyright © 2021 Liang. All rights reserved.
//

import Foundation

// 找到数组的第K大个数
// [2,1,9,8,5,4,6,3,7]

private var nums = [2,1,9,8,5,4,6,3,7]
func findK(_ K: Int, _ begin: Int, _ end: Int) -> Int {
    if end - begin < 2 {
        return -1
    }
    if K >= nums.count {
        return -1
    }
    let pivot = pivot(begin, end)
    if pivot > K {
        return findK(K, begin, pivot)
    } else if pivot < K {
        return findK(K, pivot + 1, end)
    } else {
        return nums[pivot]
    }
}

// 左闭右开
func pivot(_ begin: Int, _ end: Int) -> Int {
    var begin = begin
    var end = end
    end -= 1
    
    // 首元素作为轴点元素
    let pivot = nums[begin]
    
    while begin < end {
        // 右侧开始
        while begin < end {
            if nums[end] > pivot {
                end -= 1
            } else {
                nums[begin] = nums[end]
                begin += 1
                break // 到左侧
            }
        }
        // 左侧
        while begin < end {
            if nums[begin] < pivot {
                begin += 1
            } else {
                nums[end] = nums[begin]
                end -= 1
                break // 到左侧
            }
        }
    }
    
    // 赋值轴点
    nums[begin] = pivot
    
    return begin
}
