//
//  0099_恢复二叉搜索树.swift
//  算法-Swift
//
//  Created by liang on 2020/11/25.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/recover-binary-search-tree/

import Foundation

private var pre: TreeNode?, first: TreeNode?, second: TreeNode?
func recoverTree(_ root: TreeNode?) {
    recoverTree_helper(root)
    (first!.val, second!.val) = (second!.val, first!.val)
}

private func recoverTree_helper(_ node: TreeNode?) {
    if node == nil {
        return
    }
    recoverTree_helper(node?.left)
    if pre != nil && pre!.val > node!.val {
        second = node!
        if first != nil {
            return
        }
        first = pre!
    }
    pre = node!
    recoverTree_helper(node?.right)
}
