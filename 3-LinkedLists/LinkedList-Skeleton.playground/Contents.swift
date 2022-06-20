import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkList {
    private var head: Node?
   
    // O(1)
    func addFront(_ data: Int) {
        let node = Node(data, head)
        head = node
    }

    // O(1)
    func getFirst() -> Int? {
        if head == nil {
            return nil
        }
        return head!.data
    }

    // O(n)
    func addBack(_ data: Int) {
        let newNode = Node(data)
        if head == nil {
            head = newNode
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = newNode
    }

    // O(n)
    func getLast() -> Int? {
        if head == nil { return nil }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        return node?.data
    }

    // O(n)
    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }

        let newNode = Node(data)
        var currentNode = head
        for _ in 0 ..< (position - 1) {
            currentNode = currentNode?.next
        }
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
    func deleteFirst() {
        head = head?.next
    }

    func deleteLast() {
        var previousNode: Node? = nil
        var currentNode = head
        while currentNode?.next != nil {
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        previousNode?.next = nil
    }
    
    func delete(at position: Int) {
    }
    
    var isEmpty: Bool {
        return false
    }
    
    func clear() {
    }
    
    func printLinkedList() {
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
}

let linkedList = LinkList()
linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)
linkedList.printLinkedList()

linkedList.addFront(4)
linkedList.printLinkedList()

linkedList.addBack(5)
linkedList.printLinkedList()

linkedList.addBack(2)
linkedList.getLast()

linkedList.insert(position: 8, data: 8)
linkedList.printLinkedList()

linkedList.deleteFirst()
linkedList.printLinkedList()
