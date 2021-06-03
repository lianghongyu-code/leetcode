//
//  0328_奇偶链表.swift
//  算法
//
//  Created by liang on 2020/11/13.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/odd-even-linked-list/

import Foundation

func oddEvenList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil || head?.next?.next == nil {
        return head
    }
    var odd = head
    var even = head?.next
    let evenNode = head?.next
    while even != nil && even?.next != nil {
        odd?.next = odd?.next?.next
        odd = odd?.next
        even?.next = even?.next?.next
        even = even?.next
    }
    odd?.next = evenNode
    return head
}
