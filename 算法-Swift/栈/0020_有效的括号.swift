//
//  File.swift
//  算法
//
//  Created by liang on 2020/6/16.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/valid-parentheses/

import Foundation

// 效率低但比较好想的操作
// 遍历 包含()或[]或{}就替换为空 看最后是否剩下字符串

// 最好的结构是栈
// 遍历s 如果是左括号就入栈 如果是右括号就看栈顶是否为对应的

func isValid(_ s: String) -> Bool {
    
    if s.count == 0 || s.count == 1 {
        return false
    }
    
    let sArr = Array.init(s)
    var stack = [Character]()
    for i in sArr {
        if i == "(" || i == "{" || i == "[" {
            stack.append(i)
        }
        if i == ")" || i == "}" || i == "]" {
            if stack.count == 0 {
                return false
            }
            let j = stack.removeLast()
            if (i == ")" && j != "(") || (i == "}" && j != "{") || (i == "]" && j != "[") {
                return false
            }
        }
    }
    
    return stack.count == 0
}
