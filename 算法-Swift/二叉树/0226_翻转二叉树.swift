//
//  翻转二叉树.swift
//  算法
//
//  Created by liang on 2020/6/27.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/invert-binary-tree/

import Foundation

func invertTree(_ root: TreeNode?) -> TreeNode? {
    
    if root == nil {
        return nil
    }
    
    // 前序遍历
    (root!.left, root!.right) = (root!.right, root!.left)
    invertTree(root?.left)
    invertTree(root?.right)
    
    
    // 后序遍历
//    invertTree(root?.left)
//    invertTree(root?.right)
//    let tmp = root?.left
//    root?.left = root?.right
//    root?.right = tmp
    
    
    // 中序遍历
//    invertTree(root?.left)
//    let tmp = root?.left
//    root?.left = root?.right
//    root?.right = tmp
//    invertTree(root?.left) // 换过之后了 不能用right
    
    
    // 层序遍历
//    var res: [TreeNode] = [root!]
//    while !res.isEmpty {
//
//        let node = res.removeFirst()
//
//        let tmp = node.left
//        node.left = node.right
//        node.right = tmp
//
//        if let left = node.left {
//            res.append(left)
//        }
//        if let right = node.right {
//            res.append(right)
//        }
//    }

    return root
}
