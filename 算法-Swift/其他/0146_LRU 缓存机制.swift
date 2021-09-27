//
//  LRU.swift
//  算法-Swift
//
//  Created by liang on 2021/7/16.
//  Copyright © 2021 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/lru-cache/

// 双向链表 + 哈希表
import Foundation

private class DoubleListNode {
    var key: Int
    var val: Int
    var prev: DoubleListNode?
    var next: DoubleListNode?
    
    public init() {
        self.key = 0
        self.val = 0
        self.next = nil
        self.prev = nil
    }
}

class LRUCache {
    
    private var maxCount = 0
    private var currentCount = 0
    private var dic = [Int: DoubleListNode]()
    private var header: DoubleListNode? = nil
    private var tail: DoubleListNode? = nil
    
    init(_ capacity: Int) {
        maxCount = capacity
    }
    
    func get(_ key: Int) -> Int {
        let node = dic[key]
        // 不存在
        if node == nil {
            return -1
        }
        // 存在
        self.put(key, node!.val)
        return node!.val
    }
    
    func put(_ key: Int, _ value: Int) {
        let node = dic[key]
        // 不存在 添加node到header
        if node == nil {
            let newNode = DoubleListNode()
            newNode.key = key
            newNode.val = value
            dic[key] = newNode
            header?.prev = newNode
            newNode.next = header
            newNode.prev = nil
            header = newNode
            if currentCount == 0 { // 添加第一个元素时进行tail的赋值
                tail = header
            }
            currentCount += 1
        }
        // 存在 移动node到header
        else {
            node?.val = value
            if node?.key == header?.key { // 添加的是header的话return
                return
            }
            if node?.key == tail?.key { // 添加的是tail的话 移动tail指针到前一个节点
                tail = tail?.prev
            }
            node?.prev?.next = node?.next
            node?.next?.prev = node?.prev
            node?.next = header
            node?.prev = nil
            header?.prev = node
            header = node
        }
        // 移除多余的
        while currentCount > maxCount {
            let oldTail = tail
            tail = tail?.prev
            tail?.next = nil
            oldTail?.prev = nil
            oldTail?.next = nil
            dic.removeValue(forKey: oldTail!.key)
            currentCount -= 1
        }
    }
}
