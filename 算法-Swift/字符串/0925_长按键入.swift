//
//  0925_长按键入.swift
//  算法
//
//  Created by liang on 2020/10/21.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/long-pressed-name/

import Foundation

func isLongPressedName(_ name: String, _ typed: String) -> Bool {
    let nameArr = Array.init(name)
    let typedArr = Array.init(typed)
    var nameIndex = 0
    var typedIndex = 0
    while typedIndex < typed.count {
        if nameIndex < name.count && nameArr[nameIndex] == typedArr[typedIndex] {
            nameIndex += 1
            typedIndex += 1
        } else if (typedIndex > 0 && typedArr[typedIndex] == typedArr[typedIndex - 1]) {
            typedIndex += 1
        } else {
            return false
        }
    }
    return nameIndex == name.count
}

func isLongPressedName1(_ name: String, _ typed: String) -> Bool {
    if name.count == 0 || typed.count == 0 {
        return false
    }
    let nameArr = Array.init(name)
    let typedArr = Array.init(typed)
    var nameIndex = 0
    var typedIndex = 0
    var tmp = nameArr.first
    while nameIndex < nameArr.count && typedIndex < typedArr.count {
        if nameArr[nameIndex] == typedArr[typedIndex] {
            tmp = nameArr[nameIndex]
            nameIndex += 1
            typedIndex += 1
        } else {
            if tmp != typedArr[typedIndex] {
                return false
            }
            typedIndex += 1
        }
    }
    if nameIndex == nameArr.count {
        for i in typedIndex..<typedArr.count {
            if typedArr[i] != tmp {
                return false
            }
        }
        return true
    } else {
        return false
    }
}
