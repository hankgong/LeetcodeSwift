import Testing

//https://leetcode.cn/problems/count-bowl-subarrays/
class Solution3676 {
    func bowlSubarrays(_ nums: [Int]) -> Int {
        var descStack = [Int](), n = nums.count, result = 0
        for i in 0..<n {
            while let j = descStack.last, nums[j] < nums[i] {
                if descStack.count > 1 {
                    result += 1
                }
                descStack.removeLast()
            }
            descStack.append(i)
        }
        return result
    }
}

@Test func tests3676() async throws {
// Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let sol = Solution3676()

    #expect(2 == sol.bowlSubarrays([2,5,3,1,4]))
    #expect(3 == sol.bowlSubarrays([5,1,2,3,4]))
    #expect(0 == sol.bowlSubarrays([1000, 999, 998]))
}