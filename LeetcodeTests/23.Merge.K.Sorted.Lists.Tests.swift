//
//  Created by exbtn on 12/03/2023.
//

import XCTest

final class MergeKSortedListsTests: XCTestCase {
    
    fileprivate let solution = Solution()
    fileprivate var lists = [ListNode?]()
    
    func test_solution() {
        lists = [
            write(values: [1, 4, 5]),
            write(values: [1, 3, 4]),
            write(values: [2, 6])
        ]
        
        XCTAssertEqual(read(node: solution.mergeKLists(lists)), [1, 1, 2, 3, 4, 4, 5, 6])
    }
}

private final class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        
        var listsCopy = lists
        
        while listsCopy.count > 1 {
            var merged = [ListNode?]()
            for i in stride(from: 0, to: listsCopy.count, by: 2) {
                let l1 = listsCopy[i]
                let l2 = (i + 1) >= listsCopy.count ? nil : listsCopy[i + 1]
                merged.append(merge(l1, l2))
            }
            listsCopy = merged
        }
        
        return listsCopy.first ?? nil
    }
    
    func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var tail: ListNode? = dummy
        
        var left: ListNode? = l1
        var right: ListNode? = l2
        
        while left != nil && right != nil {
            guard let leftVal = left?.val else { continue }
            guard let rightVal = right?.val else { continue }
            
            if leftVal < rightVal {
                tail?.next = left
                left = left?.next
            } else {
                tail?.next = right
                right = right?.next
            }
            tail = tail?.next
        }
        
        if left != nil {
            tail?.next = left
        }
        if right != nil {
            tail?.next = right
        }
        
        return dummy.next
    }
}
