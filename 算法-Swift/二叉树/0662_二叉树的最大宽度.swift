//
//  0662_二叉树最大宽度.swift
//  算法
//
//  Created by liang on 2020/9/9.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/maximum-width-of-binary-tree/

import Foundation

func widthOfBinaryTree(_ root: TreeNode?) -> Int {
    
    if root == nil {
        return 0
    }
    
    var queue: [TreeNode] = [root!]
    var list: [Int] = [1]
    var maxLen = 1
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            let index = list.removeFirst()
            if let left = node.left {
                queue.append(left)
                list.append(2 &* index)
            }
            if let right = node.right {
                queue.append(right)
                list.append(2 &* index &+ 1)
            }
        }
        if list.count > 1 {
            maxLen = max(maxLen, list.last! &- list.first! &+ 1)
        }
    }
    return maxLen
}

func widthOfBinaryTree_(_ root: TreeNode?) -> Int {
    
    if root == nil {
        return 0
    }
    
    // 技巧: 两个队列
    var queue: [TreeNode] = [root!]
    var list: [Int] = [1]
    var res = 1
    var base = 1
    while !queue.isEmpty {
        for i in 0..<queue.count {
            let node = queue.removeFirst()
            var index = list.removeFirst()
            
            // 每层都重新计数
            if i == 0 {
                base = index
            }
            index = index - base
            
            if let left = node.left {
                queue.append(left)
                list.append(2 * index)
            }
            if let right = node.right {
                queue.append(right)
                list.append(2 * index + 1)
            }
        }
        if list.count > 1 {
            res = max(res, list.last! - list.first! + 1)
        }
    }
    return res
}
