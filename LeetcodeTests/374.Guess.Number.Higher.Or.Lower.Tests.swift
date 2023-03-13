//
//  Created by exbtn on 01/03/2023.
//

import XCTest

final class GuessNumberHigherOrLowerTests: XCTestCase {
    
    fileprivate let solution = Solution()
    
    func test_solution() {
        solution.setNumber(6)
        XCTAssertEqual(solution.guessNumber(10), 6)
        
        solution.setNumber(1)
        XCTAssertEqual(solution.guessNumber(1), 1)
        
        solution.setNumber(1)
        XCTAssertEqual(solution.guessNumber(2), 1)
    }
    
}

private final class Solution {
    private var number: Int = 0
    
    func guessNumber(_ n: Int) -> Int {
        if n == 1 { return 1 }
        
        var left = 1
        var right = n
        
        while left <= right {
            let mid = left + ((right - left) / 2)
            
            switch guess(mid) {
            case 0:
                return mid
            case 1:
                left = mid + 1
            case -1:
                right = mid - 1
            default:
                return -1
            }
        }
        
        return -1
    }
    
    func setNumber(_ n: Int) {
        number = n
    }
    
    private func guess(_ i: Int) -> Int {
        if i == number {
            return 0
        } else if i > number {
            return -1
        } else {
            return 1
        }
    }
}
