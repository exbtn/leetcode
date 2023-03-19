//
//  Created by exbtn on 18/03/2023.
//

import XCTest

final class DesignBrowserHistoryTests: XCTestCase {
    
    func test_solution() {
        let browserHistory = BrowserHistoryDoubleNode("leetcode.com")

        browserHistory.visit("google.com")
        browserHistory.visit("facebook.com")
        browserHistory.visit("youtube.com")
        XCTAssertEqual(browserHistory.back(1), "facebook.com")
        XCTAssertEqual(browserHistory.back(1), "google.com")
        XCTAssertEqual(browserHistory.forward(1), "facebook.com")
        browserHistory.visit("linkedin.com")
        XCTAssertEqual(browserHistory.forward(2), "linkedin.com")
        XCTAssertEqual(browserHistory.back(2), "google.com")
        XCTAssertEqual(browserHistory.back(7), "leetcode.com")
    }
    
    func test_solution_2() {
        let browserHistory = BrowserHistoryDoubleNode("momn.com")
        
        browserHistory.visit("bx.com")
        browserHistory.visit("bjyfmln.com")
        XCTAssertEqual(browserHistory.back(3), "momn.com")
        browserHistory.visit("ijtrqk.com")
        browserHistory.visit("dft.com")
        XCTAssertEqual(browserHistory.back(10), "momn.com")
        XCTAssertEqual(browserHistory.forward(10), "dft.com")
    }
    
}

private final class BrowserHistoryDoubleNode {
    
    class Node {
        var string: String
        var next, previous: Node?
        
        init(_ string: String) {
            self.string = string
        }
    }
    
    private let root: Node
    private var current: Node
    
    init(_ homepage: String) {
        root = Node(homepage)
        current = root
    }
    
    func visit(_ url: String) {
        let new = Node(url)
        current.next = new
        new.previous = current
        current = new
    }
    
    func back(_ steps: Int) -> String {
        for _ in 0..<steps {
            guard let prev = current.previous else { break }
            current = prev
        }
        
        return current.string
    }
    
    func forward(_ steps: Int) -> String {
        for _ in 0..<steps {
            guard let next = current.next else { break }
            current = next
        }
        
        return current.string
    }
}

// Two stack solution
private final class BrowserHistoryTwoStack {
    
    private var forward = [String]()
    private var backward = [String]()
    private let homepage: String
    private var current: String
    
    init(_ homepage: String) {
        self.homepage = homepage
        current = homepage
    }
    
    func visit(_ url: String) {
        forward.removeAll()
        backward.append(current)
        current = url
    }
    
    func back(_ steps: Int) -> String {
        for _ in 0..<steps {
            if backward.isEmpty { break }
            forward.append(current)
            current = backward.popLast() ?? homepage
        }
        return current
    }
    
    func forward(_ steps: Int) -> String {
        for _ in 0..<steps {
            if forward.isEmpty { break }
            backward.append(current)
            current = forward.popLast() ?? homepage
        }
        return current
    }
}

