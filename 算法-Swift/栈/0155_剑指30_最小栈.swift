//
//  File.swift
//  算法
//
//  Created by liang on 2020/9/1.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

class MinStack {
    
    var mainArr: [Int]
    var tmpArr: [Int]
    
    init() {
        mainArr = [Int]()
        tmpArr = [Int]()
    }
    
    func push(_ x: Int) {
        mainArr.append(x)
        if tmpArr.count == 0 || mainArr.last! <= tmpArr.last! {
            tmpArr.append(x)
        }
    }
    
    func pop() {
        if tmpArr.count > 0 && tmpArr.last == mainArr.removeLast() {
            tmpArr.removeLast()
        }
    }
    
    func top() -> Int {
//        if mainArr.count > 0 {
//            return mainArr.last!
//        } else {
//            return 0
//        }
        return mainArr.last ?? 0
    }
    
    func min() -> Int {
//        if tmpArr.count > 0 {
//            return tmpArr.last!
//        } else {
//            return 0
//        }
        return tmpArr.last ?? 0
    }
}
