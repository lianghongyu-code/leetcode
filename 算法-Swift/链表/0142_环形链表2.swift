//
//  0142_环形链表2.swift
//  算法
//
//  Created by liang on 2020/9/1.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/linked-list-cycle-ii/
// 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

import Foundation

func detectCycle(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return nil
    }
    
    var tmp: ListNode? = nil
    
    // 第一步找相遇点
    var slow = head
    var fast = head
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            tmp = fast!
            break
        }
    }
    
    // 没有环
    if tmp == nil {
        return nil
    }
    
    // 有环 慢指针从头到相遇点的距离一定是n倍的环的距离
    // 第二步找入环点
    var node = head
    while node !== tmp {
        node = node?.next
        tmp = tmp?.next
    }
    
    return tmp
}
