//
//  0700_二叉搜索树中的搜索.swift
//  算法
//
//  Created by liang on 2020/9/12.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/search-in-a-binary-search-tree/

import Foundation

func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    if root == nil || root?.val == val {
        return root
    }
    if root!.val < val {
        return searchBST(root?.right, val)
    } else {
        return searchBST(root?.left, val)
    }
}
