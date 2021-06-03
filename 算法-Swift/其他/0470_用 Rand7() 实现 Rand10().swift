//
//  470_用 Rand7() 实现 Rand10().swift
//  算法
//
//  Created by liang on 2020/9/3.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/implement-rand10-using-rand7/
// 随机 拒绝采样

import Foundation

private func rand7() -> Int {
    return Int(arc4random_uniform(6) + 1)
}

func rand10() -> Int {
    
    while true {
        var num = (rand7() - 1) * 7 + rand7()
        if num <= 49 {
            return 1 + num % 10
        }
        
        num = (num - 40 - 1) * 7 + rand7()
        if num <= 60 {
            return 1 + num % 10
        }
        
        num = (num - 20 - 1) * rand7()
        if num <= 20 {
            return 1 + num % 10
        }
    }
    
//    // 1/2
//    var a = rand7()
//    while a == 4 {
//        a = rand7()
//    }
//
//    // 1/5
//    var b = rand7()
//    while b > 5 {
//        b = rand7()
//    }
//
//    return b + (a < 4 ? 0 : 5)
}
