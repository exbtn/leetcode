//
//  Created by Yevhenii Veretennikov on 03/03/2023.
//

import XCTest

final class FindTheIndexOfTheFirstOccurrenceInAStringTests: XCTestCase {
    
    fileprivate let solution = Solution()
    var haystack = ""
    var needle = ""
    
    func test_solution() {
        //        haystack = "sadbutsad"
        //        needle = "sad"
        //        XCTAssertEqual(solution.strStr(haystack, needle), 0)
        
        //        haystack = "sadtisazmdasf"
        //        needle = "tisaz"
        //        XCTAssertEqual(solution.strStr(haystack, needle), 0)
        
        //        haystack = "leetcode"
        //        needle = "leeto"
        //        XCTAssertEqual(solution.strStr(haystack, needle), -1)
        
        //        haystack = "hello"
        //        needle = "ll"
        //        XCTAssertEqual(solution.strStr(haystack, needle), 2)
        
        XCTAssertEqual(solution.runningSum([1,2,3,4]), [1,3,6,10])
    }
    
}

private final class Solution {
    
    func runningSum(_ nums: [Int]) -> [Int] {
        var sum = Array(repeating: 0, count: nums.count)
        var res = 0
        
        for i in 0..<nums.count {
            res += nums[i]
            sum[i] = res
        }
        
        return sum
    }
    
    let RADIX = 26
    let MOD = 1000000033
    var MAX_WEIGHT = 1
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let m = haystack.count
        let n = needle.count
        
        (0..<needle.count).forEach { _ in MAX_WEIGHT = (MAX_WEIGHT * RADIX) % MOD }
        
        let needleHash = hash(needle)
        
        var windowStart = 0
        var windowEnd = n
        
        for _ in 0..<(m-n) {
            let startIndex = haystack.index(haystack.startIndex, offsetBy: windowStart)
            let endIndex = haystack.index(haystack.startIndex, offsetBy: windowEnd)
            let string = haystack[startIndex..<endIndex]
            let hayHash = hash(String(string))
            
            if hayHash == needleHash {
                for i in 0..<string.count {
                    let idx = haystack.index(haystack.startIndex, offsetBy: i)
                    if string[idx] != haystack[idx] {
                        break
                    }
                }
                return windowStart
            } else {
                windowStart += 1
                windowEnd += 1
            }
        }
        
        return -1
    }
    
    private func hash(_ substring: String) -> Int {
        var ans = 0
        var factor = 1
        
        for i in stride(from: substring.count-1, to: 0, by: -1) {
            let idx = substring.index(substring.startIndex, offsetBy: i)
            guard let hash = substring[idx].asciiValue else { continue }
            
            ans += Int(hash - 97) * factor
            factor = factor * RADIX
        }
        
        return ans
    }
}
