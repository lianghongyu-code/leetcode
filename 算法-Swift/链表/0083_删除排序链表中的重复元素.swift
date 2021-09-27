//
//  83_删除排序链表中的重复元素.swift
//  算法
//
//  Created by liang on 2020/8/30.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/

import Foundation

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    
    // 精简到一个指针
    if head == nil || head?.next == nil {
        return head
    }
    
    var cur = head
    while cur != nil && cur?.next != nil {
        if cur?.val == cur?.next?.val {
            cur?.next = cur?.next?.next
        } else {
            cur = cur?.next
        }
    }
    
    return head
    
    // 双指针
//    let dummy = ListNode(-1)
//    dummy.next = head
//    var pre = head
//    var cur = head?.next
//    while cur != nil {
//        if cur!.val == pre!.val {
//            pre!.next = cur!.next
//        } else {
//            pre = cur!
//        }
//        cur = cur!.next
//    }
//
//    return dummy.next
}
