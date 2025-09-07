import Testing
import LeetcodeSwift

class Solution0027 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        for j in 0..<nums.count {
            if nums[j] != val {
                nums[i] = nums[j]
                i += 1
            }
        }
        return i
    }
}

@Test func tests0027() async throws {
// Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let s = Solution0027()
    var nums = [3,2,2,3]
    var val = 3
    #expect(2==s.removeElement(&nums, val), "ok")
    
    nums = [0,1,2,2,3,0,4,2]
    val = 2
    #expect(5==s.removeElement(&nums, val), "ok")

    printList(buildList("1,2,3,4,5"))
}