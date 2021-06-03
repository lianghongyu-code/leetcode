//
//  插入排序.swift
//  算法
//
//  Created by liang on 2020/10/11.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

func insertionSort() {
    
    // 再优化 二分搜索找index
    
    // 优化 先挪动再插入 逆序对越对越明显
    for i in 1..<sortArr.count {
        var cur = i
        let tmp = sortArr[cur]
        while sortArr[cur] < sortArr[cur - 1] {
            sortArr[cur] = sortArr[cur - 1]
            cur -= 1
        }
        sortArr[cur] = tmp
    }
    
//    for i in 1..<sortArr.count {
//        var cur = i
//        while sortArr[cur] < sortArr[cur - 1] {
//            (sortArr[cur], sortArr[cur - 1]) = (sortArr[cur - 1], sortArr[cur])
//            cur -= 1
//        }
//    }
    
    print(sortArr)
}
