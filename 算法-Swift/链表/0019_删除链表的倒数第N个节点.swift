//
//  0019_删除链表的倒数第N个节点.swift
//  算法
//
//  Created by liang on 2020/10/18.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/

import Foundation

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    if head == nil {
        return nil
    }
    
    let dummy = ListNode(-1)
    dummy.next = head
    var slow = dummy
    var fast = head
    var i = n
    
    // 找要删除结点的前一个结点
    while fast != nil {
        if i <= 0 {
            slow = slow.next!
        }
        fast = fast?.next
        i -= 1
    }
    
    slow.next = slow.next?.next
    
    return dummy.next
}
