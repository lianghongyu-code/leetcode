//
//  0101_对称二叉树.swift
//  算法
//
//  Created by liang on 2020/9/10.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

// dfs
func isSymmetric_dfs(_ root: TreeNode?) -> Bool {
    return isSymmetric_dfs_helper(root, root)
}

// 技巧: 辅助函数模拟两个树
private func isSymmetric_dfs_helper(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
    if node1 == nil && node2 == nil {
        return true
    } else if node1?.val != node2?.val {
        return false
    }
    // 技巧: left && right
    return isSymmetric_dfs_helper(node1?.left, node2?.right) && isSymmetric_dfs_helper(node1?.right, node2?.left)
}

// bfs
func isSymmetric_bfs(_ root: TreeNode?) -> Bool {
    // 技巧: 一个队列但每次入队两个
    var queue = [root, root]
    while !queue.isEmpty {
        let node1 = queue.removeFirst()
        let node2 = queue.removeFirst()
        if node1 == nil && node2 == nil {
            continue
        } else if node1?.val != node2?.val {
            return false
        }
        queue.append(node1?.left)
        queue.append(node2?.right)
        queue.append(node1?.right)
        queue.append(node2?.left)
    }
    return true
}
