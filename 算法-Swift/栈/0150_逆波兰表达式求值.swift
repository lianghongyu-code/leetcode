//
//  150_逆波兰表达式求值.swift
//  算法
//
//  Created by liang on 2020/9/2.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/evaluate-reverse-polish-notation/

import Foundation

func evalRPN(_ tokens: [String]) -> Int {
    
    var stack = [Int]()
    for s in tokens {
        if "+-*/".contains(s) {
            var res = 0
            let cur = stack.removeLast()
            let pre = stack.removeLast()
            switch s {
            case "+":
                res = pre + cur
            case "-":
                res = pre - cur
            case "*":
                res = pre * cur
            case "/":
                res = pre / cur
            default:
                res = 0
            }
            stack.append(res)
        } else {
            stack.append(Int(s)!)
        }
    }
    
    return stack.removeLast()
}
