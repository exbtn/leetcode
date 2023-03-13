//
//  Created by exbtn on 01/03/2023.
//

import XCTest

final class SqrtXTests: XCTestCase {
    
    fileprivate let solution = Solution()
    
    func test_solution() {
        XCTAssertEqual(solution.mySqrt(4), 2)
        XCTAssertEqual(solution.mySqrt(8), 2)
    }
}

private final class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 0 { return 0 }
        var left = 1
        var right = x
        
        while left <= right {
            let mid = left + ((right - left) / 2)
            let multi = mid * mid
            
            if multi == x {
                return mid
            } else if multi > x {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return right
    }
}
