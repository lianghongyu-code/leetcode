//
//  0617_合并二叉树.swift
//  算法
//
//  Created by liang on 2020/9/23.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/merge-two-binary-trees/

import Foundation

func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    if t1 == nil {
        return t2
    }
    if t2 == nil {
        return t1
    }
    let newNode = TreeNode(t1!.val + t2!.val)
    newNode.left = mergeTrees(t1!.left, t2!.left)
    newNode.right = mergeTrees(t1!.right, t2!.right)
    return newNode
}
