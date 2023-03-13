//
//  Created by Yevhenii Veretennikov on 09/03/2023.
//

import XCTest

final class LinkedListCycleIITests: XCTestCase {
    
    fileprivate let solution = Solution()
    fileprivate var head: ListNode?
    fileprivate var pos: Int = 0
    
    func test_solution() {
        pos = 1
        head = write(values: [3, 2, 0, -4], pos: pos)
        XCTAssertTrue(solution.detectCycle(head) === read(node: head, pos: pos))
        
        pos = 0
        head = write(values: [1, 2], pos: pos)
        XCTAssertTrue(solution.detectCycle(head) === read(node: head, pos: pos))

        pos = -1
        head = write(values: [1], pos: pos)
        XCTAssertTrue(solution.detectCycle(head) === read(node: head, pos: pos))
    }
    
    private func read(node: ListNode?, pos: Int) -> ListNode? {
        guard pos >= 0 else { return nil }
        var i = 0
        var node = node
        while i != pos {
            node = node?.next
            i += 1
        }
        
        return node
    }
    
    private func write(values: [Int], pos: Int) -> ListNode? {
        var node: ListNode?
        var posNode: ListNode?
        var lastNode: ListNode?
        
        for (n, i) in values.enumerated() {
            if node == nil {
                node = ListNode(i)
                lastNode = node
            } else {
                lastNode?.next = ListNode(i)
                lastNode = lastNode?.next
            }
            
            if n == pos {
                posNode = lastNode
            }
        }
        
        lastNode?.next = posNode
        return node
    }
}

private final class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        guard head.next != nil else { return nil }
        
        var slow: ListNode? = head
        var fast: ListNode? = head
        var start: ListNode? = head
        
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if (slow === fast) {
                while (slow !== start) {
                    slow = slow?.next
                    start = start?.next
                }
                return start
            }
        }
        return nil
    }
}

private final class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
