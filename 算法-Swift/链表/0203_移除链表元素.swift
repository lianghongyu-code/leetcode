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
    
    // 练习
    
    
    
    
    
    
    
    
    
    
    

    
    if head == nil {
        return nil
    }
    
    // 虚拟头节点
    let sentinel = ListNode(-1)
    sentinel.next = head
    
    // 记录当前和前一个
    var pre = sentinel
    var cur = head
    
    while cur != nil {
        if cur!.val == val {
            pre.next = cur!.next
        } else {
            pre = cur!
        }
        cur = cur!.next
    }
    
    return sentinel.next
}
