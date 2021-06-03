//
//  0002_两数相加.swift
//  算法
//
//  Created by liang on 2020/10/19.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/add-two-numbers/

import Foundation

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var head1 = l1
    var head2 = l2
    let dummy = ListNode(-1)
    var head = dummy
    var tag = 0
    while head1 != nil || head2 != nil {
        let val1 = head1 == nil ? 0 : head1!.val
        let val2 = head2 == nil ? 0 : head2!.val
        let sum = val1 + val2 + tag
        tag = sum >= 10 ? 1 : 0
        let node = ListNode(sum % 10)
        head.next = node
        head = node
        head1 = head1?.next
        head2 = head2?.next
    }
    if tag == 1 {
        let node = ListNode(1)
        head.next = node
    }
    return dummy.next
}
