//
//  Created by exbtn on 13/03/2023.
//

import XCTest

final class SymmetricTreeTests: XCTestCase {
    
    fileprivate let solution = Solution()
    private var root = [Int?]()
    
    func test_solution() {
        root = [1, 2, 2, 3, 4, 4, 3]
        XCTAssertTrue(solution.isSymmetric(writeTree(root)))

        root = [1, 2, 2, nil, 3, nil, 3]
        XCTAssertFalse(solution.isSymmetric(writeTree(root)))
        
        root = [2, 3, 3, 4, 5, nil, 4]
        XCTAssertFalse(solution.isSymmetric(writeTree(root)))
    }
}

private final class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return compare(root?.left, root?.right)
    }
    
    private func compare(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil { return true }
        guard let left = left, let right = right else { return false }
        
        guard left.val == right.val else { return false }
        guard compare(left.left, right.right) else { return false }
        guard compare(left.right, right.left) else { return false }
        
        return true
    }
}
