//
//  Created by Yevhenii Veretennikov on 01/03/2023.
//

import XCTest

final class BinarySearchTests: XCTestCase {
    
    fileprivate let solution = Solution()
    var nums = [Int]()
    
    func test_solution() {
        nums = [-1, 0, 3, 5, 9, 12]
        XCTAssertEqual(solution.search(nums, 9), 4)
        
        nums = [-1, 0, 3, 5, 9, 12]
        XCTAssertEqual(solution.search(nums, 2), -1)
    }
    
}

private final class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return -1
    }
}
