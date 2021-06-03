//
//  八皇后2.swift
//  算法
//
//  Created by liang on 2020/8/2.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/n-queens/

import Foundation

private var queens = [Int]()
private var res = [[String]]()
func solveNQueens(_ n: Int) -> [[String]] {
    
    // 下标为row value为摆放的col
    queens = Array.init(repeating: 0, count: n)
    placeRow(0)
    return res
}

// 摆第几行 总行n
private func placeRow(_ row: Int) {
    
    // 退出递归条件
    if row == queens.count {
        print(queens)
        var tmpArr = [String]()
        for r in 0..<queens.count {
            var tmpStr = ""
            for c in 0..<queens.count {
                if queens[r] == c {
                    tmpStr.append("Q")
                } else {
                    tmpStr.append(".")
                }
            }
            tmpArr.append(tmpStr)
        }
        res.append(tmpArr)
        return
    }
    
    for col in 0..<queens.count {
        // 剪枝
        if isValid(row, col) {
            queens[row] = col // 这里覆盖了之前的 所以不需要回溯
            placeRow(row + 1)
//            queens[row] = 0 // 这里回溯 此解不需要
        }
    }
}

// 如果第row行第col列合理
private func isValid(_ row: Int, _ col: Int) -> Bool {
    // 行不用考虑 因为摆这一行
    for r in 0..<row {
        // 判断列 看跟其他列有没有重合
        if queens[r] == col {
            return false
        }
        // 判断对角线
        if row - r == abs(col - queens[r]) {
            return false
        }
    }
    return true
}
