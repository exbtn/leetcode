//
//  Created by exbtn on 11/03/2023.
//

import XCTest

final class ValidParenthesesTests: XCTestCase {
    
    fileprivate let solution = Solution()
    fileprivate var string = ""
    
    private var testCases: [(String, Bool)] = [
        ("([]{()})", true), ("()", true), ("()[]{}", true),
        ("(]", false), ("]", false), ("(])", false)
    ]
    
    func test_solution() {
        testCases.forEach { (str, ans) in
            XCTAssertEqual(solution.isValid(str), ans)
        }
    }
    
    func test_solution2() {
        testCases.forEach { (str, ans) in
            XCTAssertEqual(solution.isValid2(str), ans)
        }
    }
}

fileprivate class Solution {
    
    func isValid(_ s: String) -> Bool {
        var backet = [Character]()
        let match: [Character: Character] = [
            ")": "(",
            "}": "{",
            "]": "["
        ]

        for char in s {
            if let matching = match[char], let last = backet.last {
                if last == matching {
                    backet.removeLast()
                } else {
                    return false
                }
            } else {
                backet.append(char)
            }
        }

        return backet.isEmpty
    }
    
    func isValid2(_ s: String) -> Bool {
        var backet = [Character]()
        
        for char in s {
            switch char {
            case "(": backet.append(")")
            case "{": backet.append("}")
            case "[": backet.append("]")
            default:
                guard !backet.isEmpty, char == backet.removeLast() else { return false }
            }
        }
        
        return backet.isEmpty
    }
}
