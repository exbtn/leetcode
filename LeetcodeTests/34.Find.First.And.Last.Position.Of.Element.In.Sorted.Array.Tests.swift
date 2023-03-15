//
//  Created by exbtn on 14/03/2023.
//

import XCTest

final class FindFirstAndLastPositionOfElementInSortedArrayTests: XCTestCase {
    
    fileprivate let solution = Solution()
    private var target = 0
    private var nums = [Int]()
    
    func test_solution() {
        target = 8
        nums = [5, 7, 7, 8, 8, 10]
        XCTAssertEqual(solution.searchRange(nums, target), [3, 4])

        target = 6
        nums = [5, 7, 7, 8, 8, 10]
        XCTAssertEqual(solution.searchRange(nums, target), [-1, -1])

        target = 1
        nums = [1]
        XCTAssertEqual(solution.searchRange(nums, target), [0, 0])

        target = 2
        nums = [2, 2]
        XCTAssertEqual(solution.searchRange(nums, target), [0, 1])

        target = 1
        nums = [1, 3]
        XCTAssertEqual(solution.searchRange(nums, target), [0, 0])

        target = 2
        nums = [1, 2, 2]
        XCTAssertEqual(solution.searchRange(nums, target), [1, 2])

        target = 3
        nums = [3, 3, 3]
        XCTAssertEqual(solution.searchRange(nums, target), [0, 2])
    }
}

private final class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else { return [-1, -1] }
        
        return [binarySearch(nums, target, true), binarySearch(nums, target, false)]
    }
    
    private func binarySearch(_ nums: [Int], _ target: Int, _ leftBias: Bool) -> Int {
        var l = 0
        var r = nums.count - 1
        var i = -1
        
        while l <= r {
            let mid = l + ((r - l) / 2)
            
            if nums[mid] == target {
                i = mid
                if leftBias {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            } else if nums[mid] < target {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        
        return i
    }
}
