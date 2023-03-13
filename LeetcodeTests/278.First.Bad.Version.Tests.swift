//
//  Created by exbtn on 01/03/2023.
//

import XCTest

final class FirstBadVersionTests: XCTestCase {
    
    fileprivate let solution = Solution()
    
    func test_solution() {
        solution.setBadVersion(4)
        XCTAssertEqual(solution.firstBadVersion(5), 4)
        solution.setBadVersion(1)
        XCTAssertEqual(solution.firstBadVersion(1), 1)
    }
    
}

private final class Solution {
    private var badVersion: Int = 0
    
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        
        while left < right {
            let mid = left + (right - left) / 2
            let isBad = isBadVersion(mid)
            if (isBad) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
    
    func setBadVersion(_ v: Int) {
        badVersion = v
    }
    
    private func isBadVersion(_ v: Int) -> Bool {
        return v == badVersion
    }
}
