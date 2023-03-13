//
//  Created by exbtn on 13/03/2023.
//

import Foundation

final class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func write(values: [Int]) -> ListNode? {
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

func read(node: ListNode?) -> [Int] {
    var result = [Int]()
    var node = node
    while node != nil {
        result.append(node?.val ?? 0)
        node = node?.next
    }
    
    return result
}
