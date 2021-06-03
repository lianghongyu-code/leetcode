//
//  快速排序.swift
//  算法
//
//  Created by liang on 2020/7/19.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

// 对[begin, end)范围进行快速排序 (end - begin)就为长度
func quickSort(_ begin: Int, _ end: Int) {
    if (end - begin) < 2 {
        return
    }
    
    // 获取轴点的index
    let pivot = pivotIndex(begin, end)
    // 对轴点两边的两个序列递归
    quickSort(begin, pivot)
    quickSort(pivot + 1, end)
}

// 获取轴点元素的最终位置 [begin, end)
func pivotIndex(_ begin: Int, _ end: Int) -> Int {
    
    var begin = begin
    var end = end
    
    // 开始end要--一次 左闭右开
    end -= 1
    
    // 记录轴点元素 假设begin为轴点 随机的话会更好 随机选择一个然后跟begin位置的数交换 其他不变
    let pivot = sortArr[begin]
    
    while begin < end {
        
        // 最开始从右往左 / 下面的else后再从右往左
        while begin < end {
            if sortArr[end] > pivot {
                end -= 1
            } else {
                sortArr[begin] = sortArr[end]
                begin += 1
                break
            }
        }
        
        // 上面的else后开始从左往右
        while begin < end {
            if sortArr[begin] < pivot {
                begin += 1
            } else {
                sortArr[end] = sortArr[begin]
                end -= 1
                break
            }
        }
    }
    
    // 将轴点元素归入
    sortArr[begin] = pivot
    
    // 出while循环begin和end重合 即为轴点元素的位置
    return begin
}
