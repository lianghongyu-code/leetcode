//
//  0905_按奇偶排序数组.swift
//  算法
//
//  Created by liang on 2020/9/2.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/sort-array-by-parity/
/*
 给定一个非负整数数组 A，返回一个数组，在该数组中， A 的所有偶数元素之后跟着所有奇数元素。
 你可以返回满足此条件的任何数组作为答案。
 */

import Foundation

func sortArrayByParity(_ A: [Int]) -> [Int] {
    
    if A.count == 1 {
        return A
    }
    
    // 双指针
    var arr = A
    var left = 0
    var right = A.count - 1
    
    while left < right {
        // 左奇右偶交换 其他情况移动指针 %2用&1代替效率高
        if (A[left] & 1 == 1) && (A[right] & 1 == 0) {
            (arr[left], arr[right]) = (arr[right], arr[left])
            left += 1
            right -= 1
        } else if (A[left] & 1 == 0) {
            left += 1
        } else if (A[right] & 1 == 1) {
            right -= 1
        }
    }
    
    return arr
    
    // 这种方法会造成多余的操作 比如第一位是奇数 其他位都是偶数 每次都要移动
//    var arr = A
//    var j = 0
//    for i in 0..<A.count {
//        if arr[i] & 1 == 0 {
//            arr.swapAt(i, j)
//            (arr[i], arr[j]) = (arr[j], arr[i])
//            // j记录了奇数的位置
//            j += 1
//            print(arr)
//        }
//    }
//
//    return arr
}
