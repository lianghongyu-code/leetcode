//
//  八皇后.swift
//  算法
//
//  Created by liang on 2020/8/2.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/n-queens-ii/

import Foundation

private var cols = [Bool]()
private var leftTop = [Bool]()
private var rightTop = [Bool]()
private var ways = 0

// 打印需要再加一个数组记录每一行皇后的位置 索引是行号 元素是列号
private var queens = [Int]()

func solveNQueens2(_ n: Int) -> Int {
    
    cols = Array.init(repeating: false, count: n)
    leftTop = Array.init(repeating: false, count: (n<<1) - 1)
    rightTop = Array.init(repeating: false, count: leftTop.count)
    
    // 为了打印
    queens = Array.init(repeating: 0, count: n)
    
    placeRow(0)
    return ways
}

// 摆第几行
private func placeRow(_ row: Int) {
    
    // 退出递归条件
    if row == cols.count {
        // 为了打印
        show()
        ways += 1
        return
    }
    
    for col in 0..<cols.count {
        
        // 剪枝
        if cols[col] {
            continue
        }
        let ltIndex = row - col + cols.count - 1
        if leftTop[ltIndex] {
            continue
        }
        let rtIndex = row + col
        if rightTop[rtIndex] {
            continue
        }
        
        // 为了打印
        queens[row] = col
        
        cols[col] = true
        leftTop[ltIndex] = true
        rightTop[rtIndex] = true
        placeRow(row + 1)
        // 这三行是回溯
        cols[col] = false
        leftTop[ltIndex] = false
        rightTop[rtIndex] = false
    }
}

func show() {
    for r in queens {
        for c in queens {
            if queens[r] == c {
                print("1", separator:" ", terminator:"")
            } else {
                print("0", separator:" ", terminator:"")
            }
        }
        print("\n")
    }
}


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count == 0 {
        return []
    }
    for i in 0..<nums.count - 1 {
        for j in (i + 1)..<nums.count {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return []
}
