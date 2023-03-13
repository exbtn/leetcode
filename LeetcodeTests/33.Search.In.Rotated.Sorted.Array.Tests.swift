//
//  Created by exbtn on 01/03/2023.
//

import XCTest

final class SearchInRotatedSortedArrayTests: XCTestCase {
    
    fileprivate let solution = Solution()
    var nums = [Int]()
    
    func test_solution() {
        nums = [4,5,6,7,0,1,2]
        XCTAssertEqual(solution.searchRotated(nums, 0), 4)

        nums = [1,3]
        XCTAssertEqual(solution.searchRotated(nums, 3), 1)

        nums = [5,1,3]
        XCTAssertEqual(solution.searchRotated(nums, 5), 0)

        nums = [4,5,6,7,8,1,2,3]
        XCTAssertEqual(solution.searchRotated(nums, 8), 4)
    }
    
}

private final class Solution {
    func searchRotated(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + ((right - left) / 2)
            
            if nums[mid] == target {
                return mid
            }
            
            if nums[left] <= nums[mid] {
                if target > nums[mid] || target < nums[left] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            } else {
                if target < nums[mid] || target > nums[right] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        
        return -1
    }
}
