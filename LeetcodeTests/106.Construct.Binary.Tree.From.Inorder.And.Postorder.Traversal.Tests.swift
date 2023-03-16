//
//  Created by exbtn on 16/03/2023.
//

import XCTest

final class ConstructBinaryTreeFromInorderAndPostorderTraversalTests: XCTestCase {
    
    fileprivate let solution = Solution()
    private var inorder = [Int]()
    private var postorder = [Int]()
    
    func test_solution() {
        inorder = [9, 3, 15, 20, 7]
        postorder = [9, 15, 7, 20, 3]
        XCTAssertNotNil(solution.buildTree(inorder, postorder))

        inorder = [-1]
        postorder = [-1]
        XCTAssertNotNil(solution.buildTree(inorder, postorder))
    }
}

private final class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard !inorder.isEmpty || !postorder.isEmpty else { return nil }
        guard let value = postorder.last else { return nil }
        guard let index = inorder.firstIndex(of: value) else { return nil }
        
        let node = TreeNode(value)
        node.left = buildTree(Array(inorder[..<index]), Array(postorder[..<index]))
        node.right = buildTree(Array(inorder[(index+1)...]), Array(postorder[index..<postorder.endIndex-1]))
        
        return node
    }
}
