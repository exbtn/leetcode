//
//  Created by exbtn on 20/03/2023.
//

import XCTest

final class CanPlaceFlowersTests: XCTestCase {
    
    private let solution = Solution()
    private var flowerbed = [Int]()
    private var n: Int = 0
    
    func test_solution() {
        flowerbed = [1, 0, 0, 0, 1]
        n = 1
        XCTAssertTrue(solution.canPlaceFlowers(flowerbed, n))
        
        flowerbed = [1, 0, 0, 0, 1]
        n = 2
        XCTAssertFalse(solution.canPlaceFlowers(flowerbed, n))
        
        flowerbed = [1, 0, 0, 0, 0, 1]
        n = 2
        XCTAssertFalse(solution.canPlaceFlowers(flowerbed, n))
    }
}

private final class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var copy = flowerbed
        var count = 0
        
        for i in 0..<copy.count {
            guard copy[i] == 0 else { continue }
            
            let emptyLeft = i == 0 || copy[i-1] == 0
            let emptyRight = i == copy.count - 1 || copy[i+1] == 0
            
            if emptyLeft && emptyRight {
                count += 1
                copy[i] = 1
            }
        }
        
        return count >= n
    }
}
