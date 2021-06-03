//
//  0257_二叉树的所有路径.swift
//  算法
//
//  Created by liang on 2020/9/11.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

// dfs
private var res = [String]()
func binaryTreePaths_dfs(_ root: TreeNode?) -> [String] {
    binaryTreePaths_dfs_helper(root, "")
    return res
}

private func binaryTreePaths_dfs_helper(_ node: TreeNode?, _ str: String) {
    if node == nil {
        return
    }
    if node?.left == nil && node?.right == nil {
        res.append(str + String(node!.val))
    } else {
        if let left = node?.left {
            let newStr = str + String(node!.val) + "->"
            binaryTreePaths_dfs_helper(left, newStr)
        }
        if let right = node?.right {
            let newStr = str + String(node!.val) + "->"
            binaryTreePaths_dfs_helper(right, newStr)
        }
    }
}

// bfs
func binaryTreePaths_bfs(_ root: TreeNode?) -> [String] {
    if root == nil {
        return []
    }
    // 技巧: 两个队列
    var nodeQueue = [root]
    var strQueue = [String(root!.val)]
    var res = [String]()
    while !nodeQueue.isEmpty {
        let node = nodeQueue.removeFirst()
        let str = strQueue.removeFirst()
        // 到叶子节点就添加到数组 非叶子结点拼接字符串入队
        if node?.left == nil && node?.right == nil {
            res.append(str)
        } else {
            if let left = node?.left {
                nodeQueue.append(left)
                strQueue.append(str + "->" + String(left.val))
            }
            if let right = node?.right {
                nodeQueue.append(right)
                strQueue.append(str + "->" + String(right.val))
            }
        }
    }
    return res
}
