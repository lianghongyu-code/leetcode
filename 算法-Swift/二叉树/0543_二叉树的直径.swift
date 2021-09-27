//
//  0543_二叉树的直径.swift
//  算法
//
//  Created by liang on 2020/9/12.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/diameter-of-binary-tree/
// 一棵二叉树的直径长度是任意两个结点路径长度中的最大值。这条路径可能穿过也可能不穿过根结点。

import Foundation

private var res = 0
func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    diameterOfBinaryTree_helper(root)
    return res
}

private func diameterOfBinaryTree_helper(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    let left = diameterOfBinaryTree_helper(root?.left)
    let right = diameterOfBinaryTree_helper(root?.right)
    // 不过节点情况下的最大值情况
    res = max(res, left + right)
    // 左子树和右子树深度的最大值+1
    return max(left, right) + 1
}
