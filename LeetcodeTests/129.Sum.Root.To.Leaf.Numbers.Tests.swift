//
//  Created by exbtn on 14/03/2023.
//

import XCTest

final class SumRootToLeafNumbersTests: XCTestCase {
    
    fileprivate let solution = Solution()
    private var root = [Int?]()
    
    func test_solution() {
        root = [1, 2, 3]
        XCTAssertEqual(solution.sumNumbers(writeTree(root)), 25)
        
        root = [4, 9, 0, 5, 1]
        XCTAssertEqual(solution.sumNumbers(writeTree(root)), 1026)
    }
}

private final class Solution {
    
    func sumNumbers(_ root: TreeNode?) -> Int {
        return getVal(root, 0)
    }
    
    private func getVal(_ root: TreeNode?, _ val: Int) -> Int {
        guard let root = root else { return 0 }
        
        let value = val * 10 + root.val
        if root.left == nil && root.right == nil { return value }
        
        let a = getVal(root.left, value)
        let b = getVal(root.right, value)
        
        return a + b
    }

}
