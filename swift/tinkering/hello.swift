import Foundation

print("hello, world!")

/*
 * ### Constants & Strings ###
 */

var myVariable = 42
myVariable = 50

print("myVariable =" + String(myVariable))

let myConstant: Int
myConstant = 50

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble:Double = 70

print("explicitDouble=" + String(explicitDouble))

// Create a constant with an explicit type of Float and a value of 4.
let explicitFloat:Float = 4
print("explicitFloat=" + String(explicitFloat))

let label = "the with is "
let width = 94
// need the String conversation, otherwise: error: binary operator '+' cannot be
// applied to operands of type 'String' and 'Int'
let widthLabel = label + String(width)
print("widthLabel:"+widthLabel)

// simpler mixing constants in strings
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
print("I have \(apples + oranges) pieces of fruit.")

let pi = 3.14
let name = "Joe"
print("Hey \(name), did you know \(pi) times two is \(pi*2)?")

/*
 * ### Arrays ###
 */

// array
var shoppingList = ["butter", "beer", "bread", "tomatoes"]
shoppingList[1] = "wine"
print(shoppingList)

// like a leaf in the wind, watch me fly :)
// dictionary
var occupants = [
	"Malcolm" : "Captain",
	"Kaylee" : "Mechanic"
]
occupants["Jayne"] = "Public Relations"
print(occupants)

// empty array or dict with initializer syntax
var emptyArray = [String]()
emptyArray += ["First!"] // or .appent("..")
print(emptyArray)

var emptyDictionary = [String: Float]()
emptyDictionary["tree"] = 5 // value has to be float, as declared
emptyDictionary["sky"] = 5.3434
print(emptyDictionary)

/*
 * ### Flow, Optionals ###
 */

// for in
let a = 5
for i in 0..<a {
	print(i)
}

// loop array
let scores = [75, 43, 103, 87, 12]
for score in scores {
	if score > 50 {
		print("yeah! score is \(score)!")
	} else {
		print("bummer, score's only \(score)")
	}
}

// optional
// An optional value either contains a value or contains nil to indicate that
// a value is missing
var optionalString: String? = "Hellö"
print(optionalString == nil) // false

// example:
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
	greeting = "Hello, \(name)"
}
print(greeting)

// what if optionalName is nil?
optionalName = nil
print(optionalName == nil) // true

greeting = "Hello!"
if let anotherName = optionalName {
	greeting = "Hello, \(anotherName)"
} 
print(greeting) 
// prints just the Hello, the code braces is skipped as optionalName is nil

// the ?? operator:
var nickName: String? = nil
let fullName: String = "John Appleseed"
var informalGreeting = "Hi \(nickName ?? fullName)"
print(informalGreeting)

nickName = "Dude"
// kind of an OR: use the 'nickname' if there's one, else use the 'fullName'
informalGreeting = "Hi \(nickName ?? fullName)"
print(informalGreeting)

// switch
// note: hasSuffix is member of NSString bridged to String, accessable under 
// linux only when explicitly importing Foundation.
let vegetable = "red pepper"
switch vegetable {
	case "cabbage", "tomatoe":
		print("unspicy")
	case let x where x.hasSuffix("pepper"): 
		print("yes, \(x) is spicy!")
	default:
		print("undecided")
}
// note #2: you need a default case, otherwise you'll get:  error: switch must
// be exhaustive, consider adding a default clause

// for-in
let interestingNumbers = [
	"Prime": [2, 3, 5, 7, 11, 13],
	"Fibonacci": [1, 1, 2, 3, 5, 8],
	"Square": [1, 4, 9, 16, 25], // note: tailing coma ok
]

var largest = 0
var largestKind = String() // initializer
for (kind, numbers) in interestingNumbers { //unpack key-value
	for number in numbers {
		if number > largest {
			largest = number
			largestKind = kind
		}
	}
}
print("largest one is: \(largest) which is of kind: \(largestKind)")
// note: dictionaries are an unordered collection, so their keys and values are
// iterated over in an arbitrary order