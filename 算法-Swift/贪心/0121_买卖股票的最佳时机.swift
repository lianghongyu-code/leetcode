//
//  0121_买卖股票的最佳时机.swift
//  算法
//
//  Created by liang on 2020/11/8.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/
// 输入: [7,1,5,3,6,4]
// 输出: 5

import Foundation

// minTmp记录以某一天为最后一天时的历史最低
// res记录当天价格和历史最低的差值的最大值
// 时间复杂度O(n)遍历一次 空间复杂度O(n)常数个变量
func maxProfit(_ prices: [Int]) -> Int {
    let lengh = prices.count
    if lengh == 0 {
        return 0
    }
    var minTmp = Int.max
    var res = 0
    for i in 0..<lengh {
        if prices[i] < minTmp {
            minTmp = prices[i]
        } else {
            res = max(res, prices[i] - minTmp)
        }
    }
    return res
}
