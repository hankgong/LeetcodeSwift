import Testing

// https://leetcode.cn/problems/daily-temperatures/
class Solution0739 {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var res: [Int] = Array(repeating: 0, count: temperatures.count)
        var stk: [Int] = []

        for i in 0 ..< temperatures.count {
            while let j = stk.last, temperatures[i] > temperatures[j] {
                stk.removeLast()
                res[j] = i - j
            }
            stk.append(i)
        }

        return res
    }
}

@Test func s0739() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let sol = Solution0739()

    #expect([1,1,4,2,1,1,0,0] == sol.dailyTemperatures([73,74,75,71,69,72,76,73]))
}
