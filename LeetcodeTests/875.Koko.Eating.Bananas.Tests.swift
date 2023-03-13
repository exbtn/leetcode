//
//  Created by Yevhenii Veretennikov on 08/03/2023.
//

import XCTest

final class KokoEatingBananasTests: XCTestCase {
    
    fileprivate let solution = Solution()
    var piles = [Int]()
    var h: Int = 0
    
    func test_solution() {
        piles = [3, 6, 7, 11]
        h = 8
        XCTAssertEqual(solution.minEatingSpeed(piles, h), 4)

        piles = [30, 11, 23, 4, 20]
        h = 5
        XCTAssertEqual(solution.minEatingSpeed(piles, h), 30)

        piles = [30, 11, 23, 4, 20]
        h = 6
        XCTAssertEqual(solution.minEatingSpeed(piles, h), 23)

        piles = [312884470]
        h = 312884469
        XCTAssertEqual(solution.minEatingSpeed(piles, h), 2)
    }
}

private final class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1
        var r = piles.max() ?? 1
        var result = r
        
        while l <= r {
            let mid = l + ((r - l) / 2)
            
            var hours = 0
            for p in piles {
                hours += Int(ceil(Double(p) / Double(mid)))
            }
            
            if hours <= h {
                result = min(result, mid)
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        
        return result
    }
}
