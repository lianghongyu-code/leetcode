//
//  0654_最大二叉树.swift
//  算法
//
//  Created by liang on 2020/10/28.
//  Copyright © 2020 Liang. All rights reserved.
//

// https://leetcode-cn.com/problems/maximum-binary-tree/
/*
 给定一个不含重复元素的整数数组 nums 。一个以此数组直接递归构建的 最大二叉树 定义如下：
 二叉树的根是数组 nums 中的最大元素。
 左子树是通过数组中 最大值左边部分 递归构造出的最大二叉树。
 右子树是通过数组中 最大值右边部分 递归构造出的最大二叉树。
 返回有给定数组 nums 构建的 最大二叉树 。
 */

import Foundation

// 递归
func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
    return findRoot(nums, 0, nums.count)
}

private func findRoot(_ nums: [Int], _ l: Int, _ r: Int) -> TreeNode? {
    if l == r {
        return nil
    }
    var max = l
    for i in l + 1..<r {
        if nums[i] > nums[max] {
            max = i
        }
    }
    let node = TreeNode(nums[max])
    node.left = findRoot(nums, l, max)
    node.right = findRoot(nums, max + 1, r)
    return node
}

// 变种题: 返回一个数组 数组里面存着每个节点的父节点的索引 没有返回-1
// 单调栈
// 存index
// 找左右两边第一个比它大的值中的小者
