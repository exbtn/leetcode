//
//  Created by Yevhenii Veretennikov on 02/03/2023.
//

import XCTest

final class StringCompressionTests: XCTestCase {
    
    fileprivate let solution = Solution()
    var chars = [Character]()
    
    func test_solution() {
        chars = ["a", "a", "b", "b", "c", "c", "c"]
        XCTAssertEqual(solution.compress(&chars), 6)
        print(chars)
        
        chars = ["a"]
        XCTAssertEqual(solution.compress(&chars), 1)
        
        chars = ["a", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b"]
        XCTAssertEqual(solution.compress(&chars), 4)
        print(chars)
    }
    
}

private final class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        var i = 0
        var r = 0
        
        while i < chars.count {
            var groupSize = 1
            while (i + groupSize) < chars.count && chars[i] == chars[i + groupSize] {
                groupSize += 1
            }
            
            chars[r] = chars[i]
            r += 1
            
            if groupSize > 1 {
                for char in String(groupSize) {
                    chars[r] = char
                    r += 1
                }
            }
            
            i += groupSize
        }
        
        return r
    }
}
