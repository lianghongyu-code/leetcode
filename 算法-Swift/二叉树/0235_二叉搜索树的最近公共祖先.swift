//
//  0235_二叉搜索树的最近公共祖先.swift
//  算法
//
//  Created by liang on 2020/9/27.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

import Foundation

private func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if root == nil {
        return root
    }
    var node = root
    while true {
        // 第一个分叉点就是最近公共祖先
        if node!.val > p!.val && node!.val > q!.val {
            node = node!.left
        } else if node!.val < p!.val && node!.val < q!.val {
            node = node!.right
        } else {
            return node
        }
    }
}
