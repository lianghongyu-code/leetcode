//
//  0144_二叉树的前序遍历.swift
//  算法
//
//  Created by liang on 2020/9/6.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/binary-tree-preorder-traversal/

import Foundation

private var res = [Int]()

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    
    if root == nil {
        return []
    }
    
    // 迭代
    var stack = [TreeNode]()
    stack.append(root!)
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        res.append(node.val)
        if let right = node.right {
            stack.append(right)
        }
        if let left = node.left {
            stack.append(left)
        }
    }
    
    // 递归
//    res.append(root!.val)
//    preorderTraversal(root?.left)
//    preorderTraversal(root?.right)
    
    return res
}
