//
//  0701_二叉搜索树中的插入操作.swift
//  算法
//
//  Created by liang on 2020/9/12.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/insert-into-a-binary-search-tree/

import Foundation

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    if root == nil {
        return TreeNode(val)
    }
    if root!.val < val {
        root?.right = insertIntoBST(root?.right, val)
    } else {
        root?.left = insertIntoBST(root?.left, val)
    }
    return root
}
