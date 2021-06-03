//
//  0113_路径总和 II.swift
//  算法
//
//  Created by liang on 2020/9/26.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/path-sum-ii/
// 给定一个二叉树和一个目标和，找到所有从根节点到叶子节点路径总和等于给定目标和的路径。

import Foundation

private var res = [[Int]]()
func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    var cur = [Int]()
    pathSum_dfs(root, sum, &cur)
    return res
}

private func pathSum_dfs(_ root: TreeNode?, _ sum: Int, _ cur: inout [Int]) {
    if root == nil {
        return
    }
    cur.append(root!.val)
    if root?.left == nil && root?.right == nil && sum == root!.val {
        res.append(Array.init(cur))
        cur.removeLast() // 叶子节点也要做这个
        return
    }
    pathSum_dfs(root?.left, sum - root!.val, &cur)
    pathSum_dfs(root?.right, sum - root!.val, &cur)
    cur.removeLast()
}
