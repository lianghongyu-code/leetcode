//
//  冒泡排序.swift
//  算法
//
//  Created by liang on 2020/7/7.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

func bubbleSort() {
    
    for i in 0..<sortArr.count-1 {
        for j in 0..<sortArr.count-1-i {
            if sortArr[j] > sortArr[j+1] {
                (sortArr[j], sortArr[j+1]) = (sortArr[j+1], sortArr[j])
            }
        }
    }
    
    // 优化: 提前有序
//    for i in 0..<sortArr.count-1 {
//        var sorted = true
//        for j in 0..<sortArr.count-1-i {
//            if sortArr[j] > sortArr[j+1] {
//                (sortArr[j], sortArr[j+1]) = (sortArr[j+1], sortArr[j])
//                sorted = false
//            }
//        }
//        if sorted {
//            break
//        }
//    }
    
    // 不能修改i
//    for var i in 0...5 {
//        print(i)
//        if i == 2 {
//            i = 4
//        }
//    }
    
    // 允许这种操作
//    for i in arr {
//        arr.append(i)
//    }
//    print(arr)
}
