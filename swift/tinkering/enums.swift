/*
 * ### enums ###
 */

enum Rank: Int {
	case ace = 1 // normally rawValue would start with 0, but you can assign
	// another one, here we start with 1
	case two, three, four, five, six, seven, eight, nune, ten
	case jack, queen, king // rawValues 11, 12, 13

	func simpleDescription() -> String {
		switch self {
			case .ace: return "ace"
			case .jack: return "jack"
			case .queen: return "queen"			
			case .king: return "king"
			default: return String(self.rawValue)
		}
	}

	func compareRanks(otherRank: Rank) -> String {
		if self.rawValue == otherRank.rawValue {
			return "the same"	
		}		
		return "not the same"
	}
}

let ace = Rank.ace
print(ace)
let aceRawValue = ace.rawValue
print(aceRawValue)

let ten = Rank.ten
print(ten)
print(ten.rawValue)

print(ten.compareRanks(otherRank: Rank.king)) // not same
print(ten.compareRanks(otherRank: Rank.ten)) // same

// make an enum instance based on the rawValue
let rawRank = Rank(rawValue : 5)
print(rawRank)

enum Suit {
	case spades, hearts, diamonds, clubs
	func simpleDescription() -> String {
		switch self {
			case .spades: return "spades"
			case .hearts: return "hearts"
			case .diamonds: return "diamonds"
			case .clubs: return "clubs"			
		}
	}
	func color() -> String {
		switch self {
			case .spades, .clubs: return "black"
			case .hearts, .diamonds: return "red"						
		}
	}
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
print(heartsDescription)
print(hearts.color())

enum ServerResponse {
	case result(String, String)
	case timeout(String)
	case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Oups.")
let timeout = ServerResponse.timeout("no answer")

switch timeout {
	case let .result(sunrise, sunset):
		print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
	case let .failure(message):
		print("failure... \(message)")
	case let .timeout(message):
		print("timeout! \(message)")
}	