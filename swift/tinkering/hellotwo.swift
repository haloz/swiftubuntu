/*
 * ### functions & closures ###
 */

// list of named arguments (named labes are default behaviour)
// -> Returntype
func greet(person: String, day: String) -> String {
	return "Hello \(person), today is \(day)"
}
print(greet(person: "Bob", day: "Tuesday"))

func lunch(person: String, special: String) -> String {
	return "Hey, \(person), today's special is \(special)!"
}
print(lunch(person: "Frank", special: "Carpaccio"))

// use underscore to omit argument labels
// use custom argument label (in front of the parameter name)
func shortgreet(_ person: String, on day: String) -> String {
	return "Privjet \(person), today is \(day)."
}
print(shortgreet("Eve", on: "Wednesday"))

// tuples
// supply multiple return values
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
	var min = scores[0]
	var max = scores[0]
	var sum = 0

	for score in scores {
		if score > max {
			max = score
		} else if score < min {
			min = score
		}
		sum += score
	}
	return (min, max, sum)
}
let stats = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(
		"We have a min of \(stats.min) and max of \(stats.max). " +
	  	"All together this makes \(stats.sum)"
	 )
// tuple can be also accessed via index:
print(
		"We have a min of \(stats.0) and max of \(stats.1). " +
	  	"All together this makes \(stats.2)"
	 )

// variable number of arguments
func sumOf(numbers: Int...) -> Int {
	var sum = 0
	for number in numbers {
		sum += number
	}
	return sum
}
print(String(sumOf())) // 0
print(String(sumOf(numbers: 5,2,12,54))) // 73

func average(numbers: Float...) -> Float {
	var sum : Float = 0.0
	var amount = 0
	for number in numbers {
		sum += number
		amount += 1
	}
	return sum / Float(amount)
}
print(String(average(numbers: 1.5, 2.3, 8.1, 2.4)))

// func in func
func returnFifteen() -> Int {
	var y = 10
	func add() {
		y += 5
	}
	add()
	return y
}
print(returnFifteen())

// function returning another function
func makeIncrementer() -> ((Int) -> Int) {
	func addOne(number: Int) -> Int {
		return 1 + number
	}
	return addOne
}
var incrementer = makeIncrementer()
print(incrementer(7)) // 8

// function as argument
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
	for item in list {
		if condition(item) {
			return true
		}
	}
	return false
}
func lessThanTen(number: Int) -> Bool {
	return number < 10
}
var numbers = [20, 19, 9, 12]
// 2nd param is a func
print(hasAnyMatches(list: numbers, condition: lessThanTen))
// note: reminds of javascript closures, funcs are just blocks of
// code that can be called later. there're also unnamed closures:
var newNumbers = numbers.map({
	(number: Int) -> Int in
	let result = 3 * number
	return result
})
print(newNumbers) // 60, 57, 27, 36

// shorter:
print(numbers.map({ number in 3 * number}))

// zero for all odd numbers
var zeroodds = numbers.map({
	(number: Int) -> Int in
	if number % 2 == 0 {
		return number
	}
	return 0
})
print(zeroodds) // 20, 0, 0, 12

// shorter & with ternary conditional operator
print(numbers.map({ number in number % 2 == 0 ? number : 0}))

// can refer to parameters by number, not by name. pretty neat :)
print(numbers.sorted { $0 > $1 })