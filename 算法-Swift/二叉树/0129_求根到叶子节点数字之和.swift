//
//  0129_求根到叶子节点数字之和.swift
//  算法
//
//  Created by liang on 2020/10/29.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/sum-root-to-leaf-numbers/

import Foundation

func sumNumbers(_ root: TreeNode?) -> Int {
    return sumNumbers_helper(root, 0)
}

private func sumNumbers_helper(_ root: TreeNode?,_ sum: Int) -> Int {
    if root == nil {
        return 0
    }
    let sum = sum * 10 + root!.val
    if root?.left == nil && root?.right == nil {
        return sum
    }
    return sumNumbers_helper(root!.left, sum) + sumNumbers_helper(root!.right, sum)
}
