//
//  路径总和.swift
//  算法
//
//  Created by liang on 2020/8/9.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/path-sum/
// 给定一个二叉树和一个目标和，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和

import Foundation

// dfs 空间复杂度O(H) 平均O(logN)
func hasPathSum_dfs(_ root: TreeNode?, _ sum: Int) -> Bool {
    
    if root == nil {
        return false
    }
    
    if root?.left == nil && root?.right == nil {
        return sum == root!.val
    }
    // 技巧: left || right
    return hasPathSum_dfs(root?.left, sum - root!.val) || hasPathSum_dfs(root?.right, sum - root!.val)
}

// bfs 空间复杂度O(n)
func hasPathSum_bfs(_ root: TreeNode?, _ sum: Int) -> Bool {
    
    if root == nil {
        return false
    }
    
    // 技巧: 两个队列
    var nodeStack = [root!]
    var sumStack = [root!.val]

    while !nodeStack.isEmpty {
        let node = nodeStack.removeLast()
        let sumTemp = sumStack.removeLast()

        if node.left == nil && node.right == nil {
            if sumTemp == sum {
                return true
            }
        }

        if let left = node.left {
            nodeStack.append(left)
            sumStack.append(sumTemp + left.val)
        }
        if let right = node.right {
            nodeStack.append(right)
            sumStack.append(sumTemp + right.val)
        }
    }
    return false
}
