//
//  0122_买卖股票的最佳时机 II.swift
//  算法
//
//  Created by liang on 2020/11/8.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/
/*
 给定一个数组 prices ，其中 prices[i] 是一支给定股票第 i 天的价格。
 设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
 */

import Foundation

func maxProfit2(_ prices: [Int]) -> Int {
    if prices.count == 0 {
        return 0
    }
    var res = 0
    for i in 1..<prices.count {
        if prices[i] > prices[i - 1] {
            res += prices[i] - prices[i - 1]
        }
    }
    return res
}
