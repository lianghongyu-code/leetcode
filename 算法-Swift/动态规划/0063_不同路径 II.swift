//
//  0063_不同路径 II.swift
//  算法
//
//  Created by liang on 2020/9/7.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/unique-paths-ii/

import Foundation

func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    
    let m = obstacleGrid.count
    let n = obstacleGrid.first!.count
    
    if obstacleGrid[0][0] == 1 || obstacleGrid[m - 1][n - 1] == 1 {
        return 0
    }
    
    var dp = Array.init(repeating: Array.init(repeating: 0, count: n), count: m)
    
    for i in 0..<m {
        for j in 0..<n {
            if obstacleGrid[i][j] == 1 {
                dp[i][j] = 0
            } else {
                if i == 0 && j == 0 {
                    dp[i][j] = 1
                } else if i == 0 {
                    dp[i][j] = dp[i][j - 1]
                } else if j == 0 {
                    dp[i][j] = dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
    }
    
    return dp[m - 1][n - 1]
    
//    let m = obstacleGrid.count
//    let n = obstacleGrid.first?.count ?? 0
//
//    if obstacleGrid[0][0] == 1 || obstacleGrid[m - 1][n - 1] == 1 {
//        return 0
//    }
//
//    var dp = Array.init(repeating: Array.init(repeating: 0, count: n + 1), count: m + 1)
//    var a = 0
//    var b = 0
//
//    for i in 1...m {
//        for j in 1...n {
//            if i == 1 || j == 1 {
//                if i == 1 && a == 1 {
//                    dp[1][j] = 0
//                } else if j == 1 && b == 1 {
//                    dp[i][1] = 0
//                } else {
//                    dp[i][j] = 1
//                }
//            } else {
//                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
//            }
//            if obstacleGrid[i - 1][j - 1] == 1 {
//                dp[i][j] = 0
//                if i == 1 {
//                    a = 1
//                }
//                if j == 1 {
//                    b = 1
//                }
//            }
//        }
//    }
//
//    return dp[m][n]
}
