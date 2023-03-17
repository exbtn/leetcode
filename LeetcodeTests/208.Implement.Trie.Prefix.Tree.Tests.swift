//
//  Created by exbtn on 17/03/2023.
//

import XCTest

final class ImplementTriePrefixTreeTests: XCTestCase {
    
    fileprivate let trie = Trie()
    private var words = ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
    
    func test_solution() {
        trie.insert("apple")
        XCTAssertTrue(trie.search("apple"))
        XCTAssertFalse(trie.search("app"))
        XCTAssertTrue(trie.startsWith("app"))
        
        trie.insert("app")
        XCTAssertTrue(trie.search("app"))
    }
    
}

private final class Trie {
    
    private var links = [Trie]()
    private var isEnd: Bool = false
    private(set) var char: Character?
    
    init() { }
    init(_ char: Character) { self.char = char }
    
    func insert(_ word: String) {
        var node = self
        
        for char in word {
            if let charNode = node.links.first(where: { $0.char == char }) {
                node = charNode
            } else {
                let newnode = Trie(char)
                node.links.append(newnode)
                node = newnode
            }
        }
        node.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        guard let node = serchNode(word) else { return false }
        return node.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        return serchNode(prefix) != nil
    }
    
    private func serchNode(_ word: String) -> Trie? {
        var node = self
        
        for char in word {
            if let charNode = node.links.first(where: { $0.char == char }) {
                node = charNode
            } else {
                return nil
            }
        }
        
        return node
    }
}

private final class SimpleTrie {

    private var set = Set<String>()
    
    init() {
        
    }
    
    func insert(_ word: String) {
        set.insert(word)
    }
    
    func search(_ word: String) -> Bool {
        set.contains(word)
    }
    
    func startsWith(_ prefix: String) -> Bool {
        set.contains(where: { $0.hasPrefix(prefix) })
    }
}
