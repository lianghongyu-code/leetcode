//
//  0572_另一个树的子树.swift
//  算法
//
//  Created by liang on 2020/11/7.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/subtree-of-another-tree/
/*
 给定两个非空二叉树 s 和 t，检验 s 中是否包含和 t 具有相同结构和节点值的子树。s 的一个子树包括 s 的一个节点和这个节点的所有子孙。s 也可以看做它自身的一棵子树。
 */

import Foundation

// 解一: dfs
func isSubtree1(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if t == nil {
        return true
    }
    if s == nil {
        return false
    }
    return isSubtree1(s?.left, t) || isSubtree1(s?.right, t) || isSubtree1_hlper(s, t)
}

// 判断s和t是否相同
private func isSubtree1_hlper(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if s == nil && t == nil {
        return true
    }
    if s?.val != t?.val {
        return false
    }
    return isSubtree1_hlper(s?.left, t?.left) && isSubtree1_hlper(s?.right, t?.right)
}

// 解二: 序列化为字符串 子树的序列化字符串必然是原树的序列化字符串的子串
func isSubtree2(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    var str1 = ""
    isSubtree2_helper(s, &str1)
    var str2 = ""
    isSubtree2_helper(t, &str2)
    return str1.contains(str2)
}

private func isSubtree2_helper(_ node: TreeNode?, _ str: inout String) {
    guard let node = node else { return }
    str.append("(\(node.val))")
    if node.left == nil {
        str.append("l")
    } else {
        isSubtree2_helper(node.left, &str)
    }
    if node.right == nil {
        str.append("r")
    } else {
        isSubtree2_helper(node.right, &str)
    }
}
