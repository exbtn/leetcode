//
//  Created by exbtn on 15/03/2023.
//

import XCTest

final class CheckCompletenessOfABinaryTreeTests: XCTestCase {
    
    fileprivate let solution = Solution()
    private var root = [Int?]()
    
    func test_solution() {
        root = [1, 2, 3, 4, 5, 6]
        XCTAssertTrue(solution.isCompleteTree(writeTree(root)))

        root = [1, 2, 3, 4, 5, nil, 7]
        XCTAssertFalse(solution.isCompleteTree(writeTree(root)))

        root = [1, 2, 3, 5, nil, 7, 8]
        XCTAssertFalse(solution.isCompleteTree(writeTree(root)))

        root = [1, 2]
        XCTAssertTrue(solution.isCompleteTree(writeTree(root)))

        root = [1, 2, 3, 5]
        XCTAssertTrue(solution.isCompleteTree(writeTree(root)))
    }
}

private final class Solution {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        var q = [root]
        
        while !q.isEmpty {
            let node = q.removeFirst()
            if let node = node {
                q.append(node.left)
                q.append(node.right)
            } else {
                while !q.isEmpty {
                    if let _ = q.removeFirst() {
                        return false
                    }
                }
            }
        }
        
        return true
    }
}
