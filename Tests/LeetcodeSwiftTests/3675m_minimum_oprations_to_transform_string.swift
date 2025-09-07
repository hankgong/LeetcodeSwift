import Testing

class Solution3675 {
    func minOperations(_ s: String) -> Int {
        var ret = 0
        let ach = "a".first!.asciiValue!
        for c in s {
            ret = max(ret, Int(26 - (c.asciiValue! - ach))%26)
        }
        return ret
    }
}

@Test func s3675() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let sol = Solution3675()

    var s = "yz"
    #expect(sol.minOperations(s) == 2)
    s = "aa"
    #expect(sol.minOperations(s) == 0)
}
