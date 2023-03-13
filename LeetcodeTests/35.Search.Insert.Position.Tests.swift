//
//  Created by Yevhenii Veretennikov on 01/03/2023.
//

import XCTest

final class SearchInsertPositionTests: XCTestCase {
    
    fileprivate let solution = Solution()
    var nums = [Int]()
    
    func test_solution() {
        nums = [1,3,5,6]
        XCTAssertEqual(solution.searchInsert(nums, 5), 2)
        XCTAssertEqual(solution.searchInsert(nums, 2), 1)
        XCTAssertEqual(solution.searchInsert(nums, 7), 4)
        
        nums = [1]
        XCTAssertEqual(solution.searchInsert(nums, 2), 1)
    }
    
}

private final class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + ((right - left) / 2)
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return left
    }
}
