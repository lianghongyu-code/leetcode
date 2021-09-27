//
//  File.swift
//  算法
//
//  Created by liang on 2020/7/29.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/remove-linked-list-elements/

import Foundation

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    
    if head == nil {
        return nil
    }
    
    // 虚拟头节点
    let dummy = ListNode(-1)
    dummy.next = head
    
    // 记录当前和前一个
    var pre = dummy
    var cur = head
    
    while cur != nil {
        if cur!.val == val {
            pre.next = cur!.next
        } else {
            pre = cur!
        }
        cur = cur!.next
    }
    
    return dummy.next
}
