//
//  Created by exbtn on 01/03/2023.
//

import XCTest

final class PalindromeNumberTests: XCTestCase {
    
    fileprivate let solution = Solution()
    var num: Int = 0
    
    func test_solution() {
        num = 121
        XCTAssertEqual(solution.isPalindrome(num), true)
        
        num = -121
        XCTAssertEqual(solution.isPalindrome(num), false)
        
        num = 10
        XCTAssertEqual(solution.isPalindrome(num), false)
    }
    
}

private final class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x != 0 else { return true }
        guard x > 0 else { return false }
        guard x % 10 != 0 else { return false }
        
        var r = 0
        var n = x
        
        while n > r {
            r = r * 10 + n % 10
            n /= 10
        }
        
        return n == r || n == r / 10
    }
}
