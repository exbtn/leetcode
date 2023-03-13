//
//  Created by exbtn on 13/03/2023.
//

import Foundation

final class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func writeTree(_ values: [Int?]) -> TreeNode? {
    guard !values.isEmpty else { return nil }
    
    func insert(i: Int) -> TreeNode? {
        var root: TreeNode?
        if i < values.count {
            guard let value = values[i] else { return nil }
            root = TreeNode(value)
            root?.left = insert(i: 2 * i + 1)
            root?.right = insert(i: 2 * i + 2)
        }
        return root
    }
    
    return insert(i: 0)
}
