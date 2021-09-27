//
//  0165_比较版本号.swift
//  算法-Swift
//
//  Created by liang on 2021/8/28.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/compare-version-numbers/

import Foundation

func compareVersion(_ version1: String, _ version2: String) -> Int {
    let arr1 = version1.split(separator: ".")
    let arr2 = version2.split(separator: ".")
    let len = arr1.count > arr2.count ? arr1.count : arr2.count
    for i in 0..<len {
        let val1 = i < arr1.count ? Int(arr1[i])! : 0
        let val2 = i < arr2.count ? Int(arr2[i])! : 0
        // 某一组里面比大小
        if val1 > val2 {
            return 1
        } else if val1 < val2 {
            return -1
        }
    }
    // 相等
    return 0
}
