//
//  合并两个有序链表.swift
//  算法
//
//  Created by liang on 2020/7/18.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    // 练习
//    var l1 = l1
//    var l2 = l2
//    let dummy = ListNode(-1)
//    var res = dummy
//
//    while l1 != nil && l2 != nil {
//        if l1!.val >= l2!.val {
//            res.next = l2
//            l2 = l2!.next
//        } else {
//            res.next = l1
//            l1 = l1!.next
//        }
//        res = res.next!
//    }
//
//    res.next = l1 ?? l2
//
//    return dummy.next
    
    
    
    
    
    
    
    
    // 迭代
    var l1 = l1
    var l2 = l2
    // 虚拟头结点
    let res = ListNode(-1)
    var pre = res

    while l1 != nil && l2 != nil {
        if l1!.val <= l2!.val {
            pre.next = l1
            l1 = l1!.next
        } else {
            pre.next = l2
            l2 = l2!.next
        }
        pre = pre.next!
    }

    // 有一个未结束时
    pre.next = l1 ?? l2

    return res.next
    
    // 递归
//    if l1 == nil {
//        return l2
//    }
//    if l2 == nil {
//        return l1
//    }
//
//    if l1!.val <= l2!.val {
//        l1!.next = mergeTwoLists(l1!.next, l2)
//        return l1
//    } else {
//        l2!.next = mergeTwoLists(l1!, l2!.next)
//        return l2
//    }
}
