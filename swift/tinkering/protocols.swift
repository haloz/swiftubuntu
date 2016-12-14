import Foundation
// needed for abs()

/*
 * ### protocols ###
 */

// classes, enums and structs can adopt protocols

protocol ExampleProtocol {
	var simpleDescription: String { get }
	mutating func adjust() 
}

class SimpleClass: ExampleProtocol {
	var simpleDescription: String = "A very simple class."
	var anotherProperty: Int = 69105
	func adjust() {
		simpleDescription += "  Now 100% adjusted."
	}
}

// Structures and enumerations are value types. 
// By default, the properties of a value type cannot be modified
// from within its instance methods. => way around this = mark as mutating
struct SimpleStruct: ExampleProtocol {
	var simpleDescription: String = "A simple struct."
	mutating func adjust() { // error if mutating is not set here
		simpleDescription += "  Also adjusted."
	}
}

// same for an enum
enum SimpleEnum: ExampleProtocol { 
	case Base
	case Adjusted
	var simpleDescription: String {
		switch self {
			case .Base: return "A simple enum."
			case .Adjusted: return "A simple enum. Aaand abjusted."		
		}
	}

	mutating func adjust() {
		self = SimpleEnum.Adjusted
	}
}

var a = SimpleClass()
a.adjust()
print(a.simpleDescription)

var b = SimpleStruct()
b.adjust()
print(b.simpleDescription)

var c = SimpleEnum.Base
c.adjust()
print(c.simpleDescription)



/*
 * ### extension ###
 */

// extends the type Int with ExampleProtocol
extension Int: ExampleProtocol {
	var simpleDescription: String {
		return "The number \(self)"
	}
	mutating func adjust() {
		self += 42
	}
}
let myInt = 7
print(myInt.simpleDescription)

extension Double: ExampleProtocol {
	var simpleDescription: String {
		return "The number \(self)"
	}
	var absoluteValue: Double {
		return abs(self)
	}
	mutating func adjust() {
		self += 2.0
	}
}
let myDouble:Double = -5.432
print(myDouble.simpleDescription)
print(myDouble.absoluteValue)

// Array of ExampleProtocols
var examples = [ExampleProtocol]()
examples.append(a)
examples.append(b)
examples.append(c)
examples.append(myInt)
examples.append(myDouble)

for example in examples {
	print(example.simpleDescription)
}

