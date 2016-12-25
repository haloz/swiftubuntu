import Foundation

struct Keypad {
    static func findCode(_ instructionSet:[String]) -> Int {
        /*
        let pad = [
            0, 1, 2,
            3, 4, 5,
            6, 7, 8
        ]
        */
        
        var position:UInt8 = 4
        var solution = String()
        
        for line in instructionSet {
            for step in line.characters {
                if step == "U" {
                    if position > 2 {
                        position -= 3
                    }
                } else if step == "D" {
                    if position < 6 {
                        position += 3
                    }
                } else if step == "L" {
                    if position != 0 && position != 3 && position != 6 {
                        position -= 1
                    }
                } else if step == "R" {
                    if position != 2 && position != 5 && position != 8 {
                        position += 1
                    }
                }
            }
            solution += String(position+1)
        }
        
        return Int(solution)!
    }
    
    static func findCodeDiamondPad(_ instructionSet:[String]) -> String {
        /*
            1
          2 3 4
        5 6 7 8 9
          A B C
            D
         
              0
           1  2  3
        4  5  6  7  8
           9 10 11
             12
        */
        
        let validMoves : [ String : [UInt8] ] = [
            "U" : [2, 5, 6, 7, 9, 10, 11, 12],
            "D" : [0, 1, 2, 3, 5, 6, 7, 10],
            "L" : [2, 3, 5, 6, 7, 8, 10, 11],
            "R" : [1, 2, 4, 5, 6, 7, 9, 10]
        ]
        
        let upSteps : [ UInt8 : UInt8 ] = [
            2 : 0,
            5 : 1,
            6 : 2,
            7 : 3,
            9 : 5,
            10: 6,
            11: 7,
            12:10
        ]
        
        let downSteps : [ UInt8 : UInt8] = [
            0 : 2,
            1 : 5,
            2 : 6,
            3 : 7,
            5 : 9,
            6 :10,
            7 :11,
            10:12
        ]
        
        var position:UInt8 = 4
        var solution = String()
        
        for line in instructionSet {
            for step in line.characters {
                let validsForStep = validMoves[String(step)]!
                if validsForStep.contains(position) {
                    if step == "U" {
                        position = upSteps[position]!
                    } else if step == "D" {
                        position = downSteps[position]!
                    } else if step == "L" {
                        position -= 1
                    } else if step == "R" {
                        position += 1
                    }
                }
            }
            
            switch position+1 {
            case 10: solution += "A"
            case 11: solution += "B"
            case 12: solution += "C"
            case 13: solution += "D"
            default:
                solution += String(position+1)
            }
        }
        return solution
    }
        
}
