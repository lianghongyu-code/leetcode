//
//  ListNode.swift
//  算法
//
//  Created by liang on 2020/6/14.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

// 单向链表
public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
        
    }
}

// 双向链表
public class ListNode1 {
    public var val: Int
    public var next: ListNode1?
    public var prev: ListNode1?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.prev = nil
    }
    
    public init() {
        self.val = 0
        self.next = nil
        self.prev = nil
    }
    
    public init(_ val: Int, _ next: ListNode1?, _ prev: ListNode1) {
        self.val = val
        self.next = next
        self.prev = prev
    }
}
