//
//  Created by Yevhenii Veretennikov on 07/03/2023.
//

import XCTest

final class MinimumTimeToCompleteTripsTests: XCTestCase {
    
    fileprivate let solution = Solution()
    var nums = [Int]()
    
    func test_solution() {
        nums = [1, 2, 3]
        XCTAssertEqual(solution.minimumTime(nums, 5), 3)
        
        nums = [2]
        XCTAssertEqual(solution.minimumTime(nums, 1), 2)
    }
}

private final class Solution {
    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {
        var l = 1
        var r = totalTrips * time.reduce(0, max)
        
        while l < r {
            let mid = l + ((r - l) / 2)
            
            var trips = 0
            
            for t in time {
                trips += mid / t
            }
            
            if trips >= totalTrips {
                r = mid
            } else {
                l = mid + 1
            }
        }
        
        return l
    }
}
