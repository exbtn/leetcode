//
//  Created by exbtn on 10/03/2023.
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
