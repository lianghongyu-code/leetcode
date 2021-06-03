//
//  File.swift
//  算法
//
//  Created by liang on 2020/9/3.
//  Copyright © 2020 Liang. All rights reserved.
//

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
