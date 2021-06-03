//
//  0122_买卖股票的最佳时机 II.swift
//  算法
//
//  Created by liang on 2020/11/8.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/

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
