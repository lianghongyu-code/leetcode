//
//  0349_两个数组的交集.swift
//  算法
//
//  Created by liang on 2020/11/2.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/intersection-of-two-arrays/
// 给定两个数组，编写一个函数来计算它们的交集。

import Foundation

// 方法一: HashSet 可以在 O(1) 的时间内判断一个元素是否在集合中，从而降低时间复杂度
func intersection1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let set1 = Set(nums1)
    let set2 = Set(nums2)
    var res = Set<Int>()
    // 优化: 比较set1和set2大小 遍历数量小的
    for num in set1 {
        if set2.contains(num) {
            res.insert(num)
        }
    }
    return [Int](res)
}

// 方法二: 排序 + 双指针 相同则添加(添加时要去重 比较要添加的和刚添加的)并都右移 不同则小的右移
func intersection2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let arr1 = nums1.sorted()
    let arr2 = nums2.sorted()
    var res = [Int]()
    var index1 = 0
    var index2 = 0
    var indexPre = -1
    while index1 < arr1.count && index2 < arr2.count {
        if arr1[index1] == arr2[index2] {
            if indexPre == -1 || arr1[index1] != res[indexPre] {
                res.append(arr1[index1])
                indexPre += 1
            }
            index1 += 1
            index2 += 1
        } else if (arr1[index1] < arr2[index2]) {
            index1 += 1
        } else if (arr2[index2] < arr1[index1]) {
            index2 += 1
        }
    }
    return res
}
