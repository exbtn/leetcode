//
//  Created by exbtn on 01/03/2023.
//

import XCTest

final class TwoSumTests: XCTestCase {
    
    fileprivate let solution = Solution()
    var nums = [Int]()
    
    func test_solution() {
        nums = [2, 7, 11, 15]
        XCTAssertEqual(solution.twoSum(nums, 9), [0, 1])
        
        nums = [3, 2, 4]
        XCTAssertEqual(solution.twoSum(nums, 6), [1, 2])
        
        nums = [3, 3]
        XCTAssertEqual(solution.twoSum(nums, 6), [0, 1])
    }
    
}

private final class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        for (n, num) in nums.enumerated() {
            let complement = target - num
            if let item = dict[complement] {
                return [item, n]
            }
            dict[num] = n
        }
        return [0, 0]
    }
}
