//
//  0328_奇偶链表.swift
//  算法
//
//  Created by liang on 2020/11/13.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/odd-even-linked-list/
// 给定一个单链表，把所有的奇数节点和偶数节点分别排在一起。请注意，这里的奇数节点和偶数节点指的是节点编号的奇偶性，而不是节点的值的奇偶性。

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
