//
//  0117_填充每个节点的下一个右侧节点指针 II.swift
//  算法
//
//  Created by liang on 2020/9/28.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/populating-next-right-pointers-in-each-node-ii/

import Foundation

func connect(_ root: Node1?) -> Node1? {
    if root == nil {
        return nil
    }
    
    var queue = [root]
    var count = queue.count
    var pre: Node1?
    while !queue.isEmpty {
        count -= 1
        let node = queue.removeFirst()
        node?.next = pre
        pre = node
        if let right = node?.right {
            queue.append(right)
        }
        if let left = node?.left {
            queue.append(left)
        }
        if count == 0 {
            count = queue.count
            pre = nil
        }
    }
    
    return root
}
