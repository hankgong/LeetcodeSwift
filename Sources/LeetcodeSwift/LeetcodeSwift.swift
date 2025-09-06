// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

public class ListNode: Equatable {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil;}
    public init(_ val: Int) { self.val = val; self.next = nil;}
    public init(_ val: Int, _ next: ListNode?) {self.val = val; self.next = next;}

    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        var p1: ListNode? = lhs
        var p2: ListNode? = rhs
        
        while let node1 = p1, let node2 = p2 {
            if node1.val != node2.val {
                return false
            }
            p1 = node1.next
            p2 = node2.next
        }
        
        return p1 == nil && p2 == nil
    }
}

public func printList(_ head : ListNode?) {
    var current = head
    var values: [String] = []
    
    while let node = current {
        values.append("\(node.val)")
        current = node.next
    }
    
    print(values.joined(separator: " -> "))
}

public func buildList(_ values: [Int]) -> ListNode? {
    guard !values.isEmpty else { return nil }

    let head = ListNode(values[0])
    var current = head
    
    for val in values.dropFirst() {
        current.next = ListNode(val)
        current = current.next!
    }
    
    return head
}

public func buildList(_ string: String) -> ListNode? {
    let numbers = string
        .split(separator: ",")             // split by comma
        .map { $0.trimmingCharacters(in: .whitespaces) } // trim spaces
        .compactMap { Int($0) }            // convert to Int
    
    return buildList(numbers)
}

public class TreeNode : Equatable {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }

    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        if lhs.val != rhs.val {
            return false
        }
        return lhs.left == rhs.left && lhs.right == rhs.right
    }
}

public func buildTree(_ values: [Int?]) -> TreeNode? {
    guard !values.isEmpty, let first = values[0] else { return nil }
    
    let root = TreeNode(first)
    var queue: [TreeNode] = [root]
    var index = 1
    
    while index < values.count {
        let node = queue.removeFirst()
        
        // left child
        if index < values.count, let leftVal = values[index] {
            let leftNode = TreeNode(leftVal)
            node.left = leftNode
            queue.append(leftNode)
        }
        index += 1
        
        // right child
        if index < values.count, let rightVal = values[index] {
            let rightNode = TreeNode(rightVal)
            node.right = rightNode
            queue.append(rightNode)
        }
        index += 1
    }
    
    return root
}
public func buildTree(_ string: String) -> TreeNode? {
    let values = string
        .split(separator: ",")
        .map { $0.trimmingCharacters(in: .whitespaces) }
        .map { $0 == "null" ? nil : Int($0) }
    
    return buildTree(values)
}

public func printTree(_ root: TreeNode?) {
    guard let root = root else {
        print("Empty tree")
        return
    }
    
    var queue: [TreeNode?] = [root]
    var result: [String] = []
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        if let node = node {
            result.append("\(node.val)")
            queue.append(node.left)
            queue.append(node.right)
        } else {
            result.append("null")
        }
    }
    
    // Trim trailing "null"s for cleaner output
    while result.last == "null" {
        result.removeLast()
    }
    
    print(result.joined(separator: ", "))
}

public func printTree1(_ root: TreeNode?, _ prefix: String = "", _ isLeft: Bool = true) {
    guard let root = root else { return }
    
    // Print right child first (so tree grows to left in output)
    if root.right != nil {
        printTree1(root.right, prefix + (isLeft ? "│   " : "    "), false)
    }
    
    // Print current node
    print(prefix + (isLeft ? "└── " : "┌── ") + "\(root.val)")
    
    // Print left child
    if root.left != nil {
        printTree1(root.left, prefix + (isLeft ? "    " : "│   "), true)
    }
}

public struct PriorityQueue<T> {
    private var heap: [T] = []
    private let areInIncreasingOrder: (T, T) -> Bool

    public init(sort: @escaping (T, T) -> Bool) {
        self.areInIncreasingOrder = sort
    }
    
    public var isEmpty: Bool { heap.isEmpty }
    public var count: Int { heap.count }
    
    public func peek() -> T? {
        heap.first
    }
    
    public mutating func enqueue(_ element: T) {
        heap.append(element)
        siftUp(from: heap.count - 1)
    }
    
    public mutating func dequeue() -> T? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 {
            return heap.removeFirst()
        } else {
            let first = heap[0]
            heap[0] = heap.removeLast()
            siftDown(from: 0)
            return first
        }
    }
    
    // MARK: - Helpers
    private mutating func siftUp(from index: Int) {
        var childIndex = index
        let child = heap[childIndex]
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && areInIncreasingOrder(child, heap[parentIndex]) {
            heap[childIndex] = heap[parentIndex]
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
        heap[childIndex] = child
    }
    
    private mutating func siftDown(from index: Int) {
        let count = heap.count
        var parentIndex = index
        let parent = heap[parentIndex]
        
        while true {
            let leftIndex = 2 * parentIndex + 1
            let rightIndex = 2 * parentIndex + 2
            var candidateIndex = parentIndex
            
            if leftIndex < count && areInIncreasingOrder(heap[leftIndex], heap[candidateIndex]) {
                candidateIndex = leftIndex
            }
            if rightIndex < count && areInIncreasingOrder(heap[rightIndex], heap[candidateIndex]) {
                candidateIndex = rightIndex
            }
            
            if candidateIndex == parentIndex { break }
            
            heap[parentIndex] = heap[candidateIndex]
            heap[candidateIndex] = parent
            parentIndex = candidateIndex
        }
    }
}
