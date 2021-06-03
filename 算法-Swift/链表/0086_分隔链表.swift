//
//  0086_分隔链表.swift
//  算法
//
//  Created by liang on 2020/10/21.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/partition-list/

import Foundation

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    if head == nil {
        return nil
    }
    // current left right
    var cHead = head
    let lHead = ListNode(-1)
    var lcur = lHead
    let rHead = ListNode(-1)
    var rcur = rHead
    while cHead != nil {
        if cHead!.val < x {
            lcur.next = cHead
            lcur = cHead!
        } else {
            rcur.next = cHead
            rcur = cHead!
        }
        cHead = cHead!.next
    }
    // 这句不能少
    rcur.next = nil
    lcur.next = rHead.next
    return lHead.next
}
