/*
 * ### enums ###
 */

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

print(ten.compareRanks(otherRank: Rank.king))
print(ten.compareRanks(otherRank: Rank.ten))