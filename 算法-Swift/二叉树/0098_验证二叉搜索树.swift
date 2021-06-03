//
//  0098_验证二叉搜索树.swift
//  算法
//
//  Created by liang on 2020/9/12.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/validate-binary-search-tree/

import Foundation

private var min = Int.min
func isValidBST(_ root: TreeNode?) -> Bool {
    if root == nil {
        return true
    }
    let left = isValidBST(root?.left)
    if root!.val > min {
        min = root!.val
    } else {
        return false
    }
    let right = isValidBST(root?.right)
    return left && right
}
