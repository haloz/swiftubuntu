enum Rank: Int {
	case ace = 1
	case two, three, four, five, six, seven, eight, nune, ten
	case jack, queen, king 

	func simpleDescription() -> String {
		switch self {
			case .ace: return "ace"
			case .jack: return "jack"
			case .queen: return "queen"			
			case .king: return "king"
			default: return String(self.rawValue)
		}
	}
}

enum Suit: Int {
	case spades, hearts, diamonds, clubs
	func simpleDescription() -> String {
		switch self {
			case .spades: return "spades"
			case .hearts: return "hearts"
			case .diamonds: return "diamonds"
			case .clubs: return "clubs"			
		}
	}
}

/*
 * ### structs ###
 */

// structs have quite the same behaviour as classes & can include methods and
// initializers.

// But structs are ALWAYS COPIED when passed, whereas classes are PASSED BY
// REFERENCE

struct Card {
	var rank: Rank
	var suit: Suit
	func simpleDescription() -> String {
		return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
	}
	func fullDeck() -> String {
		var deck = String()
		var i = 1
		while let rank = Rank(rawValue: i) {
			var j = 0
			while let suit = Suit(rawValue: j) {
				deck += "The \(rank.simpleDescription()) of \(suit.simpleDescription())\n"
				j += 1
			}
			i += 1
		}
		return deck
	}
}
let card = Card(rank: .three, suit: .spades)
print(card.simpleDescription())

let deck = card.fullDeck()
print(deck)