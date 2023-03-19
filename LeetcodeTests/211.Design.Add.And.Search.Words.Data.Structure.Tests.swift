//
//  Created by exbtn on 19/03/2023.
//

import XCTest

final class DesignAddAndSearchWordsDataStructureTests: XCTestCase {
    
    fileprivate let dictionary = WordDictionary()
    
    func test_solution() {
        dictionary.addWord("bad")
        dictionary.addWord("dad")
        dictionary.addWord("mad")
        
        XCTAssertFalse(dictionary.search("pad"))
        XCTAssertTrue(dictionary.search("bad"))
        XCTAssertTrue(dictionary.search(".ad"))
        XCTAssertTrue(dictionary.search("b.."))
    }
    
    func test_solution2() {
        dictionary.addWord("a")
        dictionary.addWord("a")

        XCTAssertTrue(dictionary.search("."))
        XCTAssertTrue(dictionary.search("a"))
        XCTAssertFalse(dictionary.search("aa"))
        XCTAssertTrue(dictionary.search("a"))
        XCTAssertFalse(dictionary.search(".a"))
        XCTAssertFalse(dictionary.search("a."))
    }
}


private final class WordDictionary {
    
    fileprivate let trie: Trie
    
    init() { self.trie = Trie() }
    
    func addWord(_ word: String) {
        trie.insert(word)
    }
    
    func search(_ word: String) -> Bool {
        trie.search(word)
    }
}

private final class Trie {
    
    private var countSet = Set<Int>()
    private var childrens = [Character: Trie]()
    private var isEnd = false
    
    init() {}
    
    func insert(_ word: String) {
        countSet.insert(word.count)
        
        var node: Trie? = self
        word.forEach { c in
            if node?.childrens[c] == nil {
                node?.childrens[c] = Trie()
            }
            node = node?.childrens[c]
        }
        node?.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        if countSet.contains(word.count) == false { return false }
        
        return searchNode(word)
    }
    
    private func searchNode(_ word: String) -> Bool {

        func dfs(_ idx: Int, _ root: Trie?) -> Bool {
            var node: Trie? = root

            for i in idx..<word.count {
                let c = word[word.index(word.startIndex, offsetBy: i)]
                if c == ".", let node = node {
                    for child in node.childrens.values {
                        if dfs(i + 1, child) {
                            return true
                        }
                    }
                    return false
                } else {
                    if node?.childrens[c] == nil {
                        return false
                    } else {
                        node = node?.childrens[c]
                    }
                }
            }

            return node?.isEnd ?? false
        }

        return dfs(0, self)
    }
}

//class WordDictionary {
//    // count set to storage the length of the strings added
//    private var countSet: Set<Int>
//    
//    private var cache: [Character: WordDictionary]
//    private var isEnd: Bool
//    
//    init() {
//        self.countSet = []
//        self.cache = [:]
//        self.isEnd = false
//    }
//    
//    func addWord(_ word: String) {
//        var cur = self
//        countSet.insert(word.count)
//        for char in word { // O(n)
//            if cur.cache[char] == nil {
//                cur.cache[char] = WordDictionary()
//            }
//            cur = cur.cache[char]!
//        }
//        cur.isEnd = true
//    }
//    
//    func search(_ word: String) -> Bool {
//        // optimise with filtering by the length of the word
//        if countSet.contains(word.count) == false { return false }
//        
//        let wordArray = Array(word)
//        return self.search(by: wordArray, parent: self)
//    }
//    
//    // Passing parent for . case in the last position of the wordArray
//    func search(by wordArray: [Character], parent: WordDictionary) -> Bool {
//        var cur = parent
//        // Constraints: 1 <= word.length <= 25 O(25)
//        for index in 0..<wordArray.count {
//            let char = wordArray[index]
//            if char == "." {
//                // Constraints: There will be at most 3 dots in word for search queries.
//                // and the worst case we have to check 26 alphabet, O(26^3)
//                for item in cur.cache {
//                    // search the part after .
//                    let newWordArray = Array(wordArray[index+1..<wordArray.count])
//                    if item.1.search(by: newWordArray, parent: item.1) == true {
//                        return true
//                    }
//                }
//                return false
//            }
//            
//            // if char != ".", the search will be O(1)
//            if cur.cache[char] == nil { return false }
//            cur = cur.cache[char]!
//        }
//        
//        return cur.isEnd
//    }
//}
