//
//  剑指Offer22_链表中倒数第k个节点.swift
//  算法
//
//  Created by liang on 2020/8/31.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
    
    
    
    
    
    
    
    
    
    
    
    
    
    if head == nil {
        return nil
    }
    
    // 技巧: 双指针
    var slow = head
    var fast = head
    var i = k
    
    while fast != nil {
        if i <= 0 {
            slow = slow?.next
        }
        fast = fast?.next
        i -= 1
    }
    
    return slow
}
