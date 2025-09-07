import Testing

//https://leetcode.cn/problems/minimum-operations-to-equalize-array/
class Solution3674 {
    func minOperations(_ nums: [Int]) -> Int {
        return Set(nums).count == 1 ? 0 : 1
    }
}
@Test func tests3674() async throws {
// Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let s = Solution3674()

    // var nums : [Int]

    #expect(1==s.minOperations([1, 2]))
    #expect(0==s.minOperations([5, 5, 5]))
}