struct SumOfMultiples {
	static func toLimit(_ limit:Int, inMultiples: [Int]) -> Int {
		var sum = 0		
		for i in 0..<limit {			
			var toAdd = false
			for multiple in inMultiples.filter({$0 != 0}) {				
				if i % multiple == 0 {
					toAdd = true
				}
			}
			if toAdd {
				sum += i	
			}			
		}		
		return sum
	}
}
