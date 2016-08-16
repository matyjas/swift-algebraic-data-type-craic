/*: 

 # Swift Algebraic Data Types
 *"a type created by combining other types"*
*/
import Cocoa

enum Ace {
    case Ace
}

enum Face {
    case Jack, Queen, King
}

enum Pip: Int {
    case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
}

//: ## Sum type
//: 1 + 3 + 9 = 13 possible values
enum Score {
    case Ace(Ace)
    case Face(Face)
    case Pip(Pip)
}

//: ## Product types
//: 4 * 13 = 52 possible values

//: ### `Classic` struct Product type
struct Card {
    let suit: Suit
    let score: Score
}

let aceOfSpades = Card(suit: Suit.Spades, score: Score.Ace(Ace.Ace))
let jackOfClubs = Card(suit: Suit.Clubs, score: Score.Face(Face.Jack))


//: ### enum as Product type
enum CardAsEnum {
    case Value(suit: Suit, score: Score)
}

//: ### Tuples do it too
let queenOfHearts = (suit: Suit.Hearts, score: Score.Face(Face.Queen))

//: ## Recursive types
//: careful! this used to blow up

enum Hand {
    case empty
    indirect case cons(head: Card, tail: Hand)
}

let blackjack = Hand.cons(head:aceOfSpades, tail: .cons(head: jackOfClubs, tail: .empty))

/*:
 ### References
 * [Swift 3 Functional Programming](https://www.packtpub.com/application-development/swift-3-functional-programming)
 * [Wikipedia](https://en.wikipedia.org/wiki/Algebraic_data_type)
 * [dduan.net: Swift Algebraic Data Types](http://dduan.net/2015/07/12/swift-algebraic-data-types/)
 * [thepurecoder.com: Algebraic Data Types in Swift](http://thepurecoder.com/algebraic-data-types-in-swift/)
 * [blog.zuehlke.com: What I Like in Swift - And What I Do Not](http://blog.zuehlke.com/en/what-i-like-in-swift-and-what-i-do-not/)
 * [angelovillegas.com: Swift 2.0](https://angelovillegas.com/swift-2/)
 :*/


