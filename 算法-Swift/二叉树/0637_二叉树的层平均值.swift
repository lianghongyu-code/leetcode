//
//  0637_二叉树的层平均值.swift
//  算法
//
//  Created by liang on 2020/9/12.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/average-of-levels-in-binary-tree/

import Foundation

func averageOfLevels(_ root: TreeNode?) -> [Double] {
    if root == nil {
        return []
    }
    
    var res = [Double]()
    var queue = [root]
    while !queue.isEmpty {
        var total = 0
        let size = queue.count
        for _ in 0..<size {
            let node = queue.removeFirst()
            total = total + node!.val
            if let left = node?.left {
                queue.append(left)
            }
            if let right = node?.right {
                queue.append(right)
            }
        }
        res.append(Double(total) / Double(size))
    }
    return res
}
