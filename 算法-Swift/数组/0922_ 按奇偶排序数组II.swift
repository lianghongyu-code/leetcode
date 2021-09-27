//
//  File.swift
//  算法
//
//  Created by liang on 2020/9/3.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/sort-array-by-parity-ii/
/*
 给定一个非负整数数组 A， A 中一半整数是奇数，一半整数是偶数。
 对数组进行排序，以便当 A[i] 为奇数时，i 也是奇数；当 A[i] 为偶数时， i 也是偶数。
 你可以返回任何满足上述条件的数组作为答案。
 */

import Foundation

func sortArrayByParityII(_ A: [Int]) -> [Int] {
    if A.count == 1 {
        return A
    }
    var arr = A
    var even = 0
    var odd = 1
    while (even < arr.count - 1) && (odd < arr.count - 1) {
        if arr[even] & 1 == 1 && arr[odd] & 1 == 0 {
            (arr[even], arr[odd]) = (arr[odd], arr[even])
            even += 2
            odd += 2
        } else if (arr[even] & 1 == 0) {
            even += 2
        } else if (arr[odd] & 1 == 1) {
            odd += 2
        }
    }
    return arr
}
