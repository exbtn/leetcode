//
//  Created by exbtn on 11/03/2023.
//

import XCTest

final class ConvertSortedListToBinarySearchTreeTests: XCTestCase {
    
    fileprivate let solution = Solution()
    fileprivate var head: ListNode?
    
    func test_solution1() {
        head = write(values: [-10, -3, 0, 5, 9])
        _ = solution.sortedListToBST2(head)
    }
    
    func test_solution2() {
        head = write(values: [-10, -3, 0, 5, 9])
        _ = solution.sortedListToBST2(head)
    }
    
}

fileprivate class Solution {
    func sortedListToBST1(_ head: ListNode?) -> TreeNode? {
        if head == nil { return nil }
        if head?.next == nil { return TreeNode(head!.val) }
        
        var slow = head
        var fast = head?.next
        
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        let mid = slow?.next
        slow?.next = nil
        
        let left = sortedListToBST1(head)
        let right = sortedListToBST1(mid?.next)
        
        return TreeNode(mid!.val, left, right)
    }
    
    func sortedListToBST2(_ head: ListNode?) -> TreeNode? {
        var nums: [Int] = []
        var listNode = head
        while let node = listNode {
            nums.append(node.val)
            listNode = node.next
        }
        
        return sortedArrayToBST(nums, 0, nums.count - 1)
    }
    
    private func sortedArrayToBST(_ nums: [Int], _ minEdge: Int, _ maxEdge: Int) -> TreeNode? {
        let count = maxEdge - minEdge + 1
        if count == 0 { return nil }
        let half = count / 2
        let node = TreeNode(nums[minEdge+half])
        node.left = sortedArrayToBST(nums, minEdge, minEdge+half-1)
        node.right = sortedArrayToBST(nums, minEdge+half+1, maxEdge)
        return node
    }
}
