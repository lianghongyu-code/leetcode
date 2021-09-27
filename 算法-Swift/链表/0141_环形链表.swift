//
//  判断链表有没有环.swift
//  算法
//
//  Created by liang on 2020/6/14.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/linked-list-cycle/

import Foundation

// 技巧: 快慢指针 有点龟兔赛跑的意思 扣圈
func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil || head?.next == nil {
        return false
    }
    
    var slow = head
    var fast = head?.next
    
    // 这两个条件必须同时满足  保证fast.next和fast.next.next不会有空指针异常
    while fast != nil && fast?.next != nil {
        // slow走一步 fast走两步 迈大步容易错过
        slow = slow?.next
        fast = fast?.next?.next
        // 写在赋值下面 第一次没必要比
        // 有环一定会相遇! 每次循环两指针间距就减小1步
        if slow === fast {
            return true
        }
    }
    
    return false
}
