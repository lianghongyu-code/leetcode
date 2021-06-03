//
//  0094_二叉树的中序遍历.swift
//  算法
//
//  Created by liang on 2020/9/6.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/binary-tree-inorder-traversal/

import Foundation

private var res = [Int]()

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    
    if root == nil {
        return []
    }
    
    // 迭代
    var stack = [TreeNode]()
    var node = root

    while true {
        if node != nil {
            stack.append(node!)
            node = node?.left
        } else {
            if stack.isEmpty {
                break
            } else {
                node = stack.removeLast()
                res.append(node!.val)
                node = node?.right
            }
        }
    }
    
    // 递归
//    inorderTraversal(root?.left)
//    res.append(root!.val)
//    inorderTraversal(root?.right)
    
    return res
}
