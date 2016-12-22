struct Squares {
	var number:Int

	init(_ number:Int) {
		self.number = number
	}

	var squareOfSums:Int {
		get {
			let sum = (1...number).reduce(0, +)
			return sum * sum
		}		
	}

	var sumOfSquares:Int {
		get {
			return (1...number)
				.map { $0 * $0 }
				.reduce(0, +)
		}
	}

	var differenceOfSquares:Int {
		get {
			return squareOfSums - sumOfSquares	
		}		
	}
}