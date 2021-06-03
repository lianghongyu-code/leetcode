//
//  0977_有序数组的平方.swift
//  算法
//
//  Created by liang on 2020/10/18.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/squares-of-a-sorted-array/

import Foundation

func sortedSquares(_ A: [Int]) -> [Int] {
    var ret = [Int]()
    var left = 0
    var right = A.count - 1
    // 负数越小平方越大 正数越大平方越大
    while left <= right {
        if A[left] * A[left] < A[right] * A[right] {
            ret.insert(A[right] * A[right], at: 0)
            right -= 1
        } else {
            ret.insert(A[left] * A[left], at: 0)
            left += 1
        }
    }
    return ret
}
