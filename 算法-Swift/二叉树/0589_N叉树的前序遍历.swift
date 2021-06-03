//
//  0589_N叉树的前序遍历.swift
//  算法
//
//  Created by liang on 2020/9/10.
//  Copyright © 2020 Liang. All rights reserved.
//

import Foundation

private var res = [Int]()

func preorder(_ root: Node?) -> [Int] {
    
    if root == nil {
        return []
    }
    
    // 前序遍历
    res.append(root!.val)
    
    for node in root!.children {
        preorder(node)
    }
    
    // 后序遍历
//    res.append(root!.val)
    
    return res
}
