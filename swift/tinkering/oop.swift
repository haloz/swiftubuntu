/*
 * ### objects and classes ###
 */

class Shape {
	var numberOfSides = 0	
	let color = "red"

	func simpleDescription() -> String {
		return "A \(color) shape with \(numberOfSides) sides."
	}

	func setNumberOfSides(_ sides: Int) {
		numberOfSides = sides
	}
}

var myShape = Shape()
myShape.setNumberOfSides(4)
print(myShape.simpleDescription())

// have a CTOR
class NamedShape {
	var numberOfSides: Int = 0
	var name : String

	init(name: String) {
		// need self to distinguish name property fromname argument
		self.name = name 
	}

	func simpleDescription() -> String {
		return "A shape with \(numberOfSides) sides."
	}
}

var secondShape = NamedShape(name: "Triangle")
secondShape.numberOfSides = 3
print(secondShape.simpleDescription())

// inheritance
class Square: NamedShape {
	var sideLength: Double

	init(sideLength: Double, name: String) {
		self.sideLength = sideLength
		super.init(name: name)
		numberOfSides = 4
	}

	func area() -> Double {
		return sideLength * sideLength
	}

	override func simpleDescription() -> String {
		return "A square with sides of lenght \(sideLength)."
	}
}

var mySquare = Square(sideLength: 4.5, name: "Little cute cube")
print(mySquare.simpleDescription())
print(mySquare.area())

class Circle: NamedShape {
	var radius: Double

	init(radius: Double, name: String)	{
		self.radius = radius
		super.init(name: name)
		numberOfSides = 0
	}

	func area() -> Double {
		return Double.pi * radius * radius
	}

	override func simpleDescription() -> String {
		return "A circle named \(name) with radius of \(radius)."
	}	
}

var myCircle = Circle(radius: 3, name: "Loopy")
print(myCircle.simpleDescription())
print(myCircle.area())

// getter and setter
class EquilateralTriangle: NamedShape {
	var sideLength: Double = 0.0

	init(sideLength: Double, name: String) {
		self.sideLength = sideLength
		super.init(name: name)
		numberOfSides = 3
	}

	var perimeter: Double {
		get {
			return 3.0 * sideLength
		}
		set {
			sideLength = newValue / 3.0
		}
	}

	override func simpleDescription() -> String {
		return "An equilateral triangle with sides of length \(sideLength)."
	}
}

var myTriangle = EquilateralTriangle(sideLength: 3.1, name: "Spike")
print(myTriangle.perimeter)
myTriangle.perimeter = 9.9
print(myTriangle.sideLength)

// willSet and didSet
// "The code you provide is run any time the value changes outside of
// an initializer" 

class TriangleAndSquare {
	var triangle: EquilateralTriangle {
		willSet {
			square.sideLength = newValue.sideLength
		}
	}
	var square: Square {
		willSet {
			triangle.sideLength = newValue.sideLength		
		}
	}

	init(size: Double, name: String) {
		square = Square(sideLength: size, name: name)
		triangle = EquilateralTriangle(sideLength: size, name: name)
	}
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
// updating an attribute of the square subclass updates the one of the triangle
// due to cross-update via willSet between triangle and square
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

// optionals before operations
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
print(sideLength) // Optional(2.5)
// value of the whole expression is an optional value 