//
//  File.swift
//  算法
//
//  Created by liang on 2020/7/27.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

// A = [3, 2, 1], B = [], C = []
var A = [3, 2, 1]
//var A = [1, 2, 3]
var B = [Int]()
var C = [Int]()

func hanoi(_ A: inout [Int], _ B: inout [Int], _ C: inout [Int]) {
    hanoi_helper(&A, &B, &C, A.count)
}

private func hanoi_helper(_ A: inout [Int], _ B: inout [Int], _ C: inout [Int], _ n: Int) {
    if n == 0 {
        return
    }
    hanoi_helper(&A, &C, &B, n-1)
    print("把第\(n)号从\(A)移动到\(C)")
//    C.insert(A.removeFirst(), at: 0)
    C.append(A.removeLast()) // 数组添加元素是添加到后面 移动的是最上面的盘子 也就是后面这些
    hanoi_helper(&B, &A, &C, n-1)
}
