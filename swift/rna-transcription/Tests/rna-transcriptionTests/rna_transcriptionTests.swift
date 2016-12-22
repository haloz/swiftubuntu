import XCTest
@testable import rna_transcription

class rna_transcriptionTests: XCTestCase {
    func testRnaComplementOfCytosineIsGuanine() {
        XCTAssertEqual("G", Nucleotide("C").complementOfDNA)
    }

    func testRnaComplementOfGuanineIsCytosine() {
        XCTAssertEqual("C", Nucleotide("G").complementOfDNA)
    }

    func testRnaComplementOfThymineIsAdenine() {
        XCTAssertEqual("A", Nucleotide("T").complementOfDNA)
    }

    func testRnaComplementOfAdenineIsUracil() {
        XCTAssertEqual("U", Nucleotide("A").complementOfDNA)
    }

    func testRnaComplement() {
        XCTAssertEqual("UGCACCAGAAUU", Nucleotide("ACGTGGTCTTAA").complementOfDNA)
    }

    static var allTests : [(String, (rna_transcriptionTests) -> () throws -> Void)] {
        return [
            ("testRnaComplementOfCytosineIsGuanine", testRnaComplementOfCytosineIsGuanine),
            ("testRnaComplementOfGuanineIsCytosine", testRnaComplementOfGuanineIsCytosine),
            ("testRnaComplementOfThymineIsAdenine", testRnaComplementOfThymineIsAdenine),
            ("testRnaComplementOfAdenineIsUracil", testRnaComplementOfAdenineIsUracil),
            ("testRnaComplement", testRnaComplement),
        ]
    }
}
