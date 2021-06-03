//
//  0100_相同的树.swift
//  算法
//
//  Created by liang on 2020/9/10.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/same-tree/

import Foundation

// dfs
func isSameTree_dfs(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
        return true
    }
    if p?.val != q?.val {
        return false
    }
    // 技巧: left && right
    return isSameTree_dfs(p?.left, q?.left) && isSameTree_dfs(p?.right, q?.right)
}

// bfs
func isSameTree_bfs(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    // 技巧: 一个队列 入队两个 出队两个
    var queue = [p, q]
    while !queue.isEmpty {
        let node1 = queue.removeFirst()
        let node2 = queue.removeFirst()
        if node1 == nil && node2 == nil {
            continue
        }
        if node1?.val != node2?.val {
            return false
        }
        queue.append(node1?.left)
        queue.append(node2?.left)
        queue.append(node1?.right)
        queue.append(node2?.right)
    }
    return true
}
