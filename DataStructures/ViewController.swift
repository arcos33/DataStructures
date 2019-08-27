//
//  ViewController.swift
//  DataStructures
//
//  Created by user on 7/13/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let linkedList = LinkedList()
        
        linkedList.append(value: Webpage(url: "www.google.com", name: "Google"))
        linkedList.append(value: Webpage(url: "www.yahoo.com", name: "Yahoo"))
        linkedList.append(value: Webpage(url: "www.cnn.com", name: "CNN"))
        linkedList.append(value: Webpage(url: "www.univision", name: "Univision"))
        
        
    }
}

class Node {
    var value: Webpage
    weak var previous: Node?
    var next: Node?
    
    init(value: Webpage) {
        self.value = value
    }
}

class LinkedList {
    private var head: Node?
    private var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node? {
        return head
    }
    
    var last: Node? {
        return tail
    }
    
    public func append(value: Webpage) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil {
                text += ", "
            }
        }
        return text + "]"
    }
}



struct Webpage {
    var url: String
    var name: String
}
