//
//  选择排序.swift
//  算法
//
//  Created by liang on 2020/7/8.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

func selectionSort() {
//    var arr = [5, 7, 40, 28, 62, 37, 12, 13, 14]
    
    
    // 练习
    
    
    
    
    
    
    for i in 0..<sortArr.count-1 {
        var min = i
        for j in i+1..<sortArr.count {
            if sortArr[min] > sortArr[j] {
                min = j
            }
        }
        (sortArr[i], sortArr[min]) = (sortArr[min], sortArr[i])
    }
    
//    for i in 0..<arr.count-1 {
//        for j in i+1..<arr.count {
//            if arr[i] > arr[j] {
//                (arr[i], arr[j]) = (arr[j], arr[i])
//            }
//        }
//    }
    
//    print(arr)
    
    
//    let array = [1, 2, 3]
//    let newArray = array.flatMap {(Array.init(repeating: $0, count: 2))}
//    print(newArray)
    
//    var array = [1, 2, 3]
//    for _ in 0..<array.count {
//        let j = array.removeFirst()
//        array.append(j)
//        array.append(j)
//    }
//    print(array)
    
    var array = [1, 2, 3]
    for i in array.reversed() {
        array.insert(i, at: i)
    }
//    print(array)
}
