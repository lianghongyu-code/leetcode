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
    var l1 = l1
    var l2 = l2
    let dummy = ListNode(-1)
    var cur = dummy
    var tag = 0
    while l1 != nil || l2 != nil {
        let val1 = l1 == nil ? 0 : l1!.val
        let val2 = l2 == nil ? 0 : l2!.val
        let sum = val1 + val2 + tag
        tag = sum >= 10 ? 1 : 0
        let node = ListNode(sum % 10)
        cur.next = node
        cur = node
        l1 = l1?.next
        l2 = l2?.next
    }
    if tag == 1 {
        let node = ListNode(1)
        cur.next = node
    }
    return dummy.next
}
