//
//  Created by Yevhenii Veretennikov on 02/03/2023.
//

import XCTest

final class MergeSortAnArrayTests: XCTestCase {
    
    fileprivate let solution = Solution()
    var nums = [Int]()
    
    func test_solution() {
        nums = [5, 2, 3, 1]
        XCTAssertEqual(solution.sortArray(nums), [1, 2, 3, 5])
        
        nums = [5, 1, 1, 2, 0, 0]
        XCTAssertEqual(solution.sortArray(nums), [0, 0, 1, 1, 2, 5])
    }
}

private final class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        return mergeSort(nums: nums)
    }
    
    private func mergeSort(nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        
        let mid = nums.count / 2
        
        let leftArray = mergeSort(nums: Array(nums[0..<mid]))
        let rightArray = mergeSort(nums: Array(nums[mid..<nums.count]))
        
        return merge(leftArray: leftArray, rightArray: rightArray)
    }
    
    private func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
        var temp = [Int]()
        temp.reserveCapacity(leftArray.count + rightArray.count)
        var l = 0
        var r = 0
        
        while l < leftArray.count && r < rightArray.count {
            if leftArray[l] < rightArray[r] {
                temp.append(leftArray[l])
                l += 1
            } else {
                temp.append(rightArray[r])
                r += 1
            }
        }
        
        while l < leftArray.count {
            temp.append(leftArray[l])
            l += 1
        }
        
        while r < rightArray.count {
            temp.append(rightArray[r])
            r += 1
        }
        
        return temp
    }
}
