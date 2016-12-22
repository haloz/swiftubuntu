struct Nucleotide {
	var dna:String

	init(_ dna:String) {
		self.dna = dna
	}

	var complementOfDNA:String {
		get {	
			return String(dna.characters.map({ c -> Character in
				switch c {
					case "A": return "U"
					case "T": return "A"
					case "C": return "G"
					case "G": return "C"
					default : return c
				}
			}))		
		}
	}

}
