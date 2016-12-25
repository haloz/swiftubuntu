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
}
