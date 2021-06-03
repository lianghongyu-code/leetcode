//
//  0104_二叉树的最大深度.swift
//  算法
//
//  Created by liang on 2020/9/6.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/

import Foundation

func maxDepth(_ root: TreeNode?) -> Int {
    
    if root == nil {
        return 0
    }
    
    // BFS 迭代
    var queue = [root]
    var size = 1
    var num = 0
    while !queue.isEmpty {
        let node = queue.removeFirst()
        size -= 1
        if let left = node?.left {
            queue.append(left)
        }
        if let right = node?.right {
            queue.append(right)
        }
        if size == 0 {
            size = queue.count
            num += 1
        }
    }
    return num
    
    // DFS 递归
//    return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
}

// N叉树
func maxDepth(_ root: Node?) -> Int {
    if root == nil {
        return 0
    }
    
    // BFS 迭代
    var queue = [root]
    var size = 1
    var num = 0
    while !queue.isEmpty {
        let node = queue.removeFirst()
        size -= 1
        for child in node!.children {
            queue.append(child)
        }
        if size == 0 {
            size = queue.count
            num += 1
        }
    }
    return num
    
    // DFS 递归
//    var res = 0
//    for child in root!.children {
//        res = max(res,maxDepth(child))
//    }
//    return res + 1
}
