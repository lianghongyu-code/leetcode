//
//  0404_左叶子之和.swift
//  算法
//
//  Created by liang on 2020/9/12.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/sum-of-left-leaves/

import Foundation

private var res = 0
func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    sumOfLeftLeaves_helper(root, false)
    return res
}

private func sumOfLeftLeaves_helper(_ node: TreeNode?, _ isLeft: Bool) {
    if node == nil {
        return
    }
    if node?.left == nil && node?.right == nil && isLeft {
        res += node!.val
    }
    if let left = node?.left {
        sumOfLeftLeaves_helper(left, true)
    }
    if let right = node?.right {
        sumOfLeftLeaves_helper(right, false)
    }
}
