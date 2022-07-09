import UIKit

/*
 Detect A Cycle
 https://www.hackerrank.com/challenges/ctci-linked-list-cycle/problem
 https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_Tortoise_and_Hare
 
 A linked list is said to contain a cycle if any node is visited more than once while traversing the list. For example, in the following graph there is a cycle formed when node 5 points back to node 3.
 
        4
      /   \
 1 2 3      5
     \_____/
 
 */

class Node {
    var data: Int
    weak var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

// O(n)
func hasCycle(first: Node) -> Bool {
    var dict = [Int?: Bool]()
    var currentNode: Node? = first
    
    while dict[currentNode?.data] == nil {
        dict[currentNode?.data] = true
        if currentNode?.next != nil {
            currentNode = currentNode?.next
        }
    }
    
    if dict[currentNode?.next?.data] != nil {
        return true
    }
    
    return false
}

func hasCycleFloyd(first: Node) -> Bool {
    var slow: Node? = first
    var fast: Node? = first
    
    while slow != nil && fast != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow?.data == fast?.data { return true }
    }
    
    return false
}

//let node5 = Node(5)
//let node4 = Node(4)
//let node3 = Node(3)
//let node2 = Node(2)
//let head = Node(1)
//
//head.next = node2
//node2.next = node3
//node3.next = node4
//node4.next = node5
//node5.next = node3

let node10 = Node(10)
let node9 = Node(9)
let node8 = Node(8)
let node7 = Node(7)
let node6 = Node(6)
let node5 = Node(5)
let node4 = Node(4)
let node3 = Node(3)
let node2 = Node(2)
let head = Node(1)

head.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
//node6.next = node7
//node7.next = node8
//node8.next = node9
//node9.next = node3

hasCycle(first: head)
hasCycleFloyd(first: head)
