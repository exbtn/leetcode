//
//  Created by exbtn on 01/03/2023.
//

import XCTest

final class AddTwoNumbersTests: XCTestCase {
    
    fileprivate let solution = Solution()
    fileprivate var l1: ListNode?
    fileprivate var l2: ListNode?
    
    func test_solution() {
        l1 = write(values: [2, 4, 3])
        l2 = write(values: [5, 6, 4])
        XCTAssertEqual(read(node: solution.addTwoNumbers(l1, l2)), [7, 0, 8])
        
        l1 = write(values: [0])
        l2 = write(values: [0])
        XCTAssertEqual(read(node: solution.addTwoNumbers(l1, l2)), [0])
        
        l1 = write(values: [9, 9, 9, 9, 9, 9, 9])
        l2 = write(values: [9, 9, 9, 9])
        XCTAssertEqual(read(node: solution.addTwoNumbers(l1, l2)), [8, 9, 9, 9, 0, 0, 0, 1])
    }
    
}

private final class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let startNode = ListNode(0)
        var finalNode: ListNode? = startNode
        
        var p = l1
        var q = l2
        var carry = 0
        
        while p != nil || q != nil {
            let num1 = p?.val ?? 0
            let num2 = q?.val ?? 0
            let sum = carry + num1 + num2
            carry = sum / 10
            finalNode?.next = ListNode(sum % 10)
            finalNode = finalNode?.next
            p = p?.next
            q = q?.next
        }
        
        if carry != 0 { finalNode?.next = ListNode(carry) }
        
        return startNode.next
    }
}
