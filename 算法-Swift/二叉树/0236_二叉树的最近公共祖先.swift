//
//  0236_二叉树的最近公共祖先.swift
//  算法
//
//  Created by liang on 2020/11/21.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/

import Foundation

private func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if root == nil || root === p || root === q {
        return root
    }
    let left = lowestCommonAncestor(root?.left, p, q)
    let right = lowestCommonAncestor(root?.right, p, q)
    if left == nil {
        return right
    }
    if right == nil {
        return left
    }
    return root
}
