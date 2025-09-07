import Testing
import LeetcodeSwift

class Solution0021 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var l1 = list1
        var l2 = list2
        let prehead: ListNode = ListNode(-1)
        var prev: ListNode? = prehead
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                prev?.next = l1
                l1 = l1?.next
            } else {
                prev?.next = l2
                l2 = l2?.next
            }
            prev = prev?.next
        }
        prev?.next = l1 != nil ? l1 : l2
        return prehead.next
    }
}

@Test func tests0021() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let s = Solution0021()

    // var nums1: [Int]
    // var nums2: [Int]
    // var m, n: Int

    // nums1 = [1,2,3,0,0,0]
    // m = 3 
    // n = 3
    // nums2 = [2, 5, 6]

    // var list1: ListNode
    // var list2: ListNode

    let n2 = ListNode(4)
    let n1 = ListNode(2, n2)
    let n0 = ListNode(1, n1)

    let n5 = ListNode(4)
    let n4 = ListNode(3, n5)
    let n3 = ListNode(1, n4)

    let m0 = ListNode(4)
    let m1 = ListNode(4, m0)
    let m2 = ListNode(3, m1)
    let m3 = ListNode(2, m2)
    let m4 = ListNode(1, m3)
    let m5 = ListNode(1, m4)

    #expect(s.mergeTwoLists(n0, n3) == m5)
    printList(buildList([1, 2, 3]))
    // printList(buildList("1,2, 3"))
    // s.mergeTwoLists(n0, n3)?.printList()
    // m5.printList()

    // let tree1 = buildTree([1, 2, 3, nil, 4, 5, nil, 6, 7, 8, 9, 10, 11, 12])
    // let tree2 = buildTree([1, 2, 3, nil, 4, 5, nil, 6, 8, 8, 9, 10, 11, 12])
    // printTree(tree)
    // print(tree1 == tree2)

    // var pq = PriorityQueue<Int>(sort: <)  // smallest element has highest priority
    // pq.enqueue(5)
    // pq.enqueue(1)
    // pq.enqueue(3)

    // print(pq.dequeue()!)  // 1
    // print(pq.dequeue()!)  // 3
    // print(pq.dequeue()!)  // 5


    // #expect([0, 1]==s.merge(&nums1, m, nums2, n), "ok")
    // s.merge(&nums1, m, nums2, n)
    // #expect([1,2,2,3,5,6]==nums1)

    // nums = [3, 2, 4]
    // target = 6
    // #expect([1, 2]==s.twoSum(nums, target))

    // nums = [3, 3]
    // target = 6
    // #expect([0, 1]==s.twoSum(nums, target))
}
