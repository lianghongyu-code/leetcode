//
//  0617_合并二叉树.swift
//  算法
//
//  Created by liang on 2020/9/23.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/merge-two-binary-trees/
/*
 给定两个二叉树，想象当你将它们中的一个覆盖到另一个上时，两个二叉树的一些节点便会重叠。
 你需要将他们合并为一个新的二叉树。合并的规则是如果两个节点重叠，那么将他们的值相加作为节点合并后的新值，否则不为 NULL 的节点将直接作为新二叉树的节点。
 */

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
