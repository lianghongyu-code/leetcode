//
//  0543_二叉树的直径.swift
//  算法
//
//  Created by liang on 2020/9/12.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/diameter-of-binary-tree/

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
