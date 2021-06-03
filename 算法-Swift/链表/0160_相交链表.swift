//
//  0160_相交链表.swift
//  算法
//
//  Created by liang on 2020/10/20.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/intersection-of-two-linked-lists/

import Foundation

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    if headA == nil || headB == nil {
        return nil
    }
    var curA = headA
    var curB = headB
    while curA !== curB {
        curA = (curA == nil) ? headB : curA?.next
        curB = (curB == nil) ? headA : curB?.next
    }
    return curA // 如果没有相交点会返回nil 都跑完A+B AB同时为nil
}

func getIntersectionNode_1(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var newHeadA = headA
    var newHeadB = headB
    var countA = 1
    var countB = 1
    while newHeadA != nil {
        newHeadA = newHeadA?.next
        countA += 1
    }
    while newHeadB != nil {
        newHeadB = newHeadB?.next
        countB += 1
    }
    newHeadA = headA
    newHeadB = headB
    if countA > countB {
        var tag = countA - countB
        while newHeadA !== newHeadB {
            newHeadA = newHeadA?.next
            if tag <= 0 {
                newHeadB = newHeadB?.next
            }
            tag -= 1
            if newHeadA == nil {
                return nil
            }
        }
    } else {
        var tag = countB - countA
        while newHeadA !== newHeadB {
            newHeadB = newHeadB?.next
            if tag <= 0 {
                newHeadA = newHeadA?.next
            }
            tag -= 1
            if newHeadB == nil {
                return nil
            }
        }
    }
    return newHeadA
}
