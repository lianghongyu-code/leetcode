//
//  File.swift
//  算法
//
//  Created by liang on 2020/6/14.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
// 给定要删除的结点

import Foundation

func deleteNode(_ node:ListNode?) {
    node?.val = (node?.next?.val)!
    node?.next = node?.next?.next
}
