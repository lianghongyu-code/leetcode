//
//  0145_二叉树的后序遍历.swift
//  算法
//
//  Created by liang on 2020/9/6.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/binary-tree-postorder-traversal/

import Foundation

private var res = [Int]()

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    
    if root == nil {
        return []
    }
    
    // 迭代
    var stack = [TreeNode]()
    stack.append(root!)
    var pre: TreeNode?

    while !stack.isEmpty {
        let top = stack.last!
        if (top.left == nil && top.right == nil) || (top.left === pre || top.right === pre) {
            let last = stack.removeLast()
            res.append(last.val)
            pre = last
        } else {
            if let right = top.right {
                stack.append(right)
            }
            if let left = top.left {
                stack.append(left)
            }
        }
    }
    
    // 递归
//    postorderTraversal(root?.left)
//    postorderTraversal(root?.right)
//    res.append(root!.val)
    
    return res
}
