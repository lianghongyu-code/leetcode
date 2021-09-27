//
//  File.swift
//  算法
//
//  Created by liang on 2020/8/9.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/flatten-binary-tree-to-linked-list/
/*
 给你二叉树的根结点 root ，请你将它展开为一个单链表：
 展开后的单链表应该同样使用 TreeNode ，其中 right 子指针指向链表中下一个结点，而左子指针始终为 null 。
 展开后的单链表应该与二叉树 先序遍历 顺序相同。
 */

import Foundation

var nodeArr = [TreeNode]()
var next: TreeNode? = nil

func flatten(_ root: TreeNode?) {
    
    // MARK: 后序遍历 从后往前 空间复杂度O(1)
    if let node = root {
        flatten(node.right)
        flatten(node.left)
        node.right = next // 这句在前 先赋值有值的 以免覆盖了在左的next
        node.left = nil
        next = node
    }
    
    
    // MARK: 从前往后 空间复杂度O(N)
//    nodeArr.removeAll()
//    flattenHelper(root)
//    for i in 1..<nodeArr.count {
//        let prev = nodeArr[i - 1]
//        let cur = nodeArr[i]
//        prev.left = nil
//        prev.right = cur
//    }
}

private func flatten_helper(_ node: TreeNode?) {
    if let node = node {
        nodeArr.append(node)
        flatten_helper(node.left)
        flatten_helper(node.right)
    }
//    nodeArr.append(node!)
//    if let left = node?.left {
//        flattenHelper(left)
//    }
//    if let right = node?.right {
//        flattenHelper(right)
//    }
}
