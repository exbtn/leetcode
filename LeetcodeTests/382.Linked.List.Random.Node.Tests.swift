//
//  Created by Yevhenii Veretennikov on 10/03/2023.
//

import XCTest

final class LinkedListRandomNodeTests: XCTestCase {
    
    fileprivate var solution: Solution?
    fileprivate var head: ListNode?
    
    func test_solution() {
        head = write(values: [1, 2, 3])
        let solution = Solution(head)
        
        print(solution.getRandom())
        print(solution.getRandom())
        print(solution.getRandom())
        print(solution.getRandom())
        print(solution.getRandom())
        print(solution.getRandom())
        
        XCTAssertTrue(true)
    }
    
}

fileprivate class Solution {
    
    fileprivate let head: ListNode?
    
    init(_ head: ListNode?) {
        self.head = head
    }
    
    func getRandom() -> Int {
        var current = head
        var scope: Float = 1
        var result = -1
        
        while let node = current {
            if Float.random(in: 0..<1) < 1 / scope {
                result = node.val
            }
            
            current = node.next
            scope += 1
        }
        
        return result
    }
}

private final class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

private extension LinkedListRandomNodeTests {
    private func write(values: [Int]) -> ListNode? {
        var node: ListNode?
        var lastNode: ListNode?
        for i in values {
            if node == nil {
                node = ListNode(i)
                lastNode = node
            } else {
                lastNode?.next = ListNode(i)
                lastNode = lastNode?.next
            }
        }
        
        return node
    }
}
