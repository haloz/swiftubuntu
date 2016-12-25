import XCTest
@testable import dayOne

class dayOneTests: XCTestCase {
    func testExample1() {
        let puzzleInput = "R2, L3"
        let distance = Taxicab.distanceToHQ(puzzleInput)
        XCTAssertEqual(distance, 5)
    }
    
    func testExample2() {
        XCTAssertEqual(Taxicab.distanceToHQ("R2, R2, R2"), 2)
    }
    
    func testExample3() {
        XCTAssertEqual(Taxicab.distanceToHQ("R5, L5, R5, R3"), 12)
    }
    
    func testMyInstructions() {
        let puzzleInput = "R4, R3, L3, L2, L1, R1, L1, R2, R3, L5, L5, R4, L4, R2, R4, L3, R3, L3, R3, R4, R2, L1, R2, L3, L2, L1, R3, R5, L1, L4, R2, L4, R3, R1, R2, L5, R2, L189, R5, L5, R52, R3, L1, R4, R5, R1, R4, L1, L3, R2, L2, L3, R4, R3, L2, L5, R4, R5, L2, R2, L1, L3, R3, L4, R4, R5, L1, L1, R3, L5, L2, R76, R2, R2, L1, L3, R189, L3, L4, L1, L3, R5, R4, L1, R1, L1, L1, R2, L4, R2, L5, L5, L5, R2, L4, L5, R4, R4, R5, L5, R3, L1, L3, L1, L1, L3, L4, R5, L3, R5, R3, R3, L5, L5, R3, R4, L3, R3, R1, R3, R2, R2, L1, R1, L3, L3, L3, L1, R2, L1, R4, R4, L1, L1, R3, R3, R4, R1, L5, L2, R2, R3, R2, L3, R4, L5, R1, R4, R5, R4, L4, R1, L3, R1, R3, L2, L3, R1, L2, R3, L3, L1, L3, R4, L4, L5, R3, R5, R4, R1, L2, R3, R5, L5, L4, L1, L1"
        XCTAssertEqual(Taxicab.distanceToHQ(puzzleInput), 288)
    }


    static var allTests : [(String, (dayOneTests) -> () throws -> Void)] {
        return [
            ("testExample1", testExample1),
            ("testExample2", testExample2),
            ("testExample3", testExample3),
            ("testMyInstructions", testMyInstructions)
        ]
    }
}
