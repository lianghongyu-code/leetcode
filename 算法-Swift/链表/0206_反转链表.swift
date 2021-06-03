//
//  File.swift
//  算法
//
//  Created by liang on 2020/6/14.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/reverse-linked-list/
// 定义一个函数，输入一个链表的头结点，反转该链表并输出反转后链表的头结点。

import Foundation

// 练习
func reverseList(_ head: ListNode?) -> ListNode? {
    
    
    return nil
}








// 递归
func reverseList_1(_ head: ListNode?) -> ListNode? {
    
    if head == nil || head?.next == nil {
        return head
    }
    
    let newHead: ListNode? = reverseList_1(head?.next)
    head?.next?.next = head
    head?.next = nil
    
    return newHead
}

// 迭代 头插法
func reverseList_2(_ head: ListNode?) -> ListNode? {
    
    if head == nil || head?.next == nil {
        return head
    }
    
    var cur = head
    var pre: ListNode? = nil
    
    while cur != nil { // 右边 -> 下一个的左边
        let tmp = cur?.next
        cur?.next = pre
        pre = cur
        cur = tmp
    }
    
    return pre
}
