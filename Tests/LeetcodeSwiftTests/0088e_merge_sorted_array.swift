import Testing

class Solution0088 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1
        while i >= 0 || j >= 0 {
            if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
                nums1[i + j + 1] = nums1[i]
                i -= 1
            } else {
                nums1[i + j + 1] = nums2[j]
                j -= 1
            }
        }
    }
}

@Test func tests0088() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let s = Solution0088()

    var nums1: [Int]
    var nums2: [Int]
    var m, n: Int

    nums1 = [1,2,3,0,0,0]
    m = 3 
    n = 3
    nums2 = [2, 5, 7]
    // #expect([0, 1]==s.merge(&nums1, m, nums2, n), "ok")
    s.merge(&nums1, m, nums2, n)
    #expect([1,2,2,3,5,6]==nums1)

    // nums = [3, 2, 4]
    // target = 6
    // #expect([1, 2]==s.twoSum(nums, target))

    // nums = [3, 3]
    // target = 6
    // #expect([0, 1]==s.twoSum(nums, target))
}
