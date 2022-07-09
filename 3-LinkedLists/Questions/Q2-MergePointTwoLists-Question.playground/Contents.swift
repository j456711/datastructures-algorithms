import UIKit

/*
 Find Merge Point of Two Lists

 Given pointers to the head nodes of 2 linked lists that merge together at some point, find the node where the two lists merge. The merge point is where both lists point to the same node, i.e. they reference the same memory location. It is guaranteed that the two head nodes will be different, and neither will be NULL. If the lists share a common node, return that node's data value.

 Note: After the merge point, both lists will share the same node pointers.
 
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: Node?) -> Int {
    if head == nil {
        return 0
    }
    
    var len = 0
    var current = head
    while current != nil {
        len += 1
        current = current?.next
    }
    return len
}

func printLinkedList(_ head: Node?) {
    if head == nil { return }
    
    var result = [Int]()
    var node = head
    result.append(node!.data)
    
    while node?.next != nil {
        result.append(node!.next!.data)
        node = node?.next
    }
    
    print(result)
}

// 暴力解
// O(n^2)
func findMerge(headA: Node?, headB: Node?) -> Int? {
    let lengthA = length(headA) // O(n)
    let lengthB = length(headB) // O(n)
    print(lengthA)
    print(lengthB)

    var currentA = headA
    for _ in 0 ..< lengthA { // O(n)
        var currentB = headB
        for _ in 0 ..< lengthB { // O(n)
            let dataA = currentA?.data
            let dataB = currentB?.data
            print("A: \(dataA ?? 0), B: \(dataB ?? 0)")
            currentB = currentB?.next

            if dataA == dataB { return dataA }
        }
        currentA = currentA?.next
    }
    return nil
}

// 用空間（dictionary）換取時間
// O(n)
func findMergeSpaceTime(headA: Node?, headB: Node?) -> Int? {
    let lengthA = length(headA) // O(n)
    let lengthB = length(headB) // O(n)
    print(lengthA)
    print(lengthB)
    
    var dict = [Int?: Bool]()

    var currentA = headA
    for _ in 0 ..< lengthA { // O(n)
        dict[currentA?.data] = true
        currentA = currentA?.next
    }
    
    var currentB = headB
    for _ in 0 ..< lengthB { // O(n)
        if dict[currentB?.data] != nil { return currentB?.data }
        currentB = currentB?.next
    }
    
    return nil
}


// 口 -> 口 ->| 口 -> 口 ->
//           |            \
//           |             口 -> 口 -> 口
//           |            /
//           | 口 -> 口 ->
//
// 算其中一條 link list 多出來的 node 有幾個，剩下的再一起比對
// O(n)
func findMergeInsight(headA: Node?, headB: Node?) -> Int? {
    let lengthA = length(headA) // O(n)
    let lengthB = length(headB) // O(n)
    print(lengthA)
    print(lengthB)

    let extraNodeCount: Int
    var longerNode: Node?
    var shorterNode: Node?
    if lengthA >= lengthB {
        longerNode = headA
        shorterNode = headB
        extraNodeCount = lengthA - lengthB
    } else {
        longerNode = headB
        shorterNode = headA
        extraNodeCount = lengthB - lengthA
    }
    
    for _ in 0 ..< extraNodeCount {
        longerNode = longerNode?.next
    }
    
    for _ in 0 ..< lengthB {
        if longerNode?.data == shorterNode?.data { return longerNode?.data }
        longerNode = longerNode?.next
        shorterNode = shorterNode?.next
    }
    
    return nil
}

// 1 2 3 4 5 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

// 10 11 12 13 4 5 6
let node11 = Node(11, node4)
let node10 = Node(10, node11)

printLinkedList(node1)
printLinkedList(node10)

findMerge(headA: node1, headB: node10)
findMergeSpaceTime(headA: node1, headB: node10)
findMergeInsight(headA: node10, headB: node1)
