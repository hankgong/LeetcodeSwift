import Testing

class Solution0001 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var tmap : [Int: Int] = [:]
        
        for (i, num) in nums.enumerated() {
            let comp = target - num
            if let j = tmap[comp] {
                return [j, i]
            }
            tmap[num] = i
        }

        return []
    }
}


@Test func tests0001() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let s = Solution0001() 

    var nums = [2,7,11,15]
    var target = 9
    #expect([0, 1]==s.twoSum(nums, target), "ok")

    nums = [3, 2, 4]
    target = 6
    #expect([1, 2]==s.twoSum(nums, target))

    nums = [3, 3]
    target = 6
    #expect([0, 1]==s.twoSum(nums, target))
}
