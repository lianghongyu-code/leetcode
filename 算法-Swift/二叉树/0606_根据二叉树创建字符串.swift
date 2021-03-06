//
//  0606_根据二叉树创建字符串.swift
//  算法
//
//  Created by liang on 2020/11/8.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/construct-string-from-binary-tree/
/*
 你需要采用前序遍历的方式，将一个二叉树转换成一个由括号和整数组成的字符串。
 空节点则用一对空括号 "()" 表示。而且你需要省略所有不影响字符串与原始二叉树之间的一对一映射关系的空括号对。
 */

import Foundation

// 4中情况
// 1.左右子树都为空
// 2.左子树不为空 右子树为空
// 3.左子树为空 右子树不为空
// 4.左右子树都不为空
func tree2str(_ t: TreeNode?) -> String {
    if t == nil {
        return ""
    }
    if t?.left == nil && t?.right == nil {
        return "\(t!.val)"
    }
    if t?.right == nil {
        return "\(t!.val)(\(tree2str(t?.left)))"
    }
    return "\(t!.val)(\(tree2str(t?.left)))(\(tree2str(t?.right)))"
}
