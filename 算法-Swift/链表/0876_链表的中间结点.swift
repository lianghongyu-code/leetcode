//
//  876_链表的中间结点.swift
//  算法
//
//  Created by liang on 2020/8/30.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/middle-of-the-linked-list/

import Foundation

func middleNode(_ head: ListNode?) -> ListNode? {
    
    if head == nil {
        return nil
    }
    
    // 技巧: 快慢指针
    var slow = head
    var fast = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return slow
    
    // 数组
//    var cur = head
//    var listArr = [ListNode]()
//    while cur != nil {
//        listArr.append(cur!)
//        cur = cur?.next
//    }
//    return listArr[listArr.count / 2]
}
