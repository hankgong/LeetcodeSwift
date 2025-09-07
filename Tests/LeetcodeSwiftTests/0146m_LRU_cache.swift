import Testing

class Node {
    var key: Int
    var val: Int
    var next: Node?
    var prev: Node?

    init(_ key: Int = 0, _ val: Int = 0) {
        self.key = key
        self.val = val
    }
}

class LRUCache {
    let dummy = Node()
    let capacity: Int

    var keyToNode: [Int: Node] = [:]

    init(_ capacity: Int) {
        self.capacity = capacity
        dummy.next = dummy
        dummy.prev = dummy
    }

    func get(_ key: Int) -> Int {
        guard let node = getNode(key) else {
            return -1
        }
        return node.val
    }

    func put(_ key: Int, _ value: Int) {
        if let node = getNode(key) {
            node.val = value
            return
        }

        if keyToNode.count == capacity {
            if let last = dummy.prev, last !== dummy {
                remove(last)
                keyToNode[last.key] = nil
            }
        }

        let node = Node(key, value)
        pushFront(node)
        keyToNode[key] = node
    }

    private func getNode(_ key: Int) -> Node? {
        guard let node = keyToNode[key] else {
            return nil
        }
        remove(node)
        pushFront(node)
        return node
    }

    private func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    private func pushFront(_ node: Node) {
        node.next = dummy.next
        node.prev = dummy
        dummy.next?.prev = node
        dummy.next = node
    }
}

@Test func tests0146() async throws {
// Write your test here and use APIs like `#expect(...)` to check expected conditions.
    // let s = Solution0146()
}