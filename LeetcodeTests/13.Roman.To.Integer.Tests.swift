//
//  Created by exbtn on 01/03/2023.
//

import XCTest

final class RomanToIntegerTests: XCTestCase {
    
    fileprivate let solution = Solution()
    var roman: String = ""
    
    func test_solution() {
        roman = "III"
        XCTAssertEqual(solution.romanToInt(roman), 3)
        
        roman = "LVIII"
        XCTAssertEqual(solution.romanToInt(roman), 58)
        
        roman = "MCMXCIV"
        XCTAssertEqual(solution.romanToInt(roman), 1994)
    }
    
}

private final class Solution {
    func romanToInt(_ s: String) -> Int {
        var result = 0
        var previous = 0
        
        for char in s.reversed() {
            let value = intValue(for: char)
            result += previous > value ? -value : value
            previous = value
        }
        
        return result
    }
    
    private func intValue(for c: String.Element) -> Int {
        switch c {
        case "I": return 1
        case "V": return 5
        case "X": return 10
        case "L": return 50
        case "C": return 100
        case "D": return 500
        case "M": return 1000
        default: return 0
        }
    }
}
