//
//  层序遍历.swift
//  算法
//
//  Created by liang on 2020/6/26.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/binary-tree-level-order-traversal/

import Foundation

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    
    if root == nil {
        return []
    }
    
    var res = [[Int]]()
    var queue: [TreeNode] = [root!]
    
    // 只有while循环 表示一个一个遍历
    // 里面有for循环 表示一层一层遍历 每层再一个一个遍历
    while !queue.isEmpty {
        var levelArr: [Int] = []
        // 这层for循环看具体需求
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            levelArr.append(node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        res.append(levelArr)
    }
    
    return res
}

// N叉树
func levelOrder(_ root: Node?) -> [[Int]] {
    if root == nil {
        return []
    }
    
    var res = [[Int]]()
    var queue: [Node] = [root!]
    while !queue.isEmpty {
        var levelArr: [Int] = []
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            levelArr.append(node.val)
            for child in node.children {
                queue.append(child)
            }
        }
        res.append(levelArr)
    }
    
    return res
}

// 剑指 Offer 32 - III. 从上到下打印二叉树 III
func levelOrder_(_ root: TreeNode?) -> [[Int]] {
    
    if root == nil {
        return []
    }
    
    var res = [[Int]]()
    var queue: [TreeNode] = [root!]
    var isEven = true
    while !queue.isEmpty {
        var levelArr: [Int] = []
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            if isEven {
                levelArr.append(node.val)
            } else {
                levelArr.insert(node.val, at: 0)
            }
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        isEven = !isEven
        res.append(levelArr)
    }
    
    return res
}
