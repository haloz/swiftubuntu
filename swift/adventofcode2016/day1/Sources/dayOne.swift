import Foundation

struct Taxicab {
    static func distanceToHQ(_ instructions:String) -> Int {
        var travelledNorth = 0
        var travelledEast = 0
        var pointing = "north"
        
        for step in instructions.components(separatedBy: ", ") {
            let indexFirstChar = step.index(step.startIndex, offsetBy: 1)
            let direction = step.substring(to: indexFirstChar)
            let distance = step.substring(from: indexFirstChar)
            
            if pointing == "north" {
                if direction == "L" {
                    travelledEast -= Int(distance)!
                    pointing = "west"
                } else if direction == "R" {
                    travelledEast += Int(distance)!
                    pointing = "east"
                }
            } else if pointing == "west" {
                if direction == "L" {
                    travelledNorth -= Int(distance)!
                    pointing = "south"
                } else if direction == "R" {
                    travelledNorth += Int(distance)!
                    pointing = "north"
                }
            } else if pointing == "east" {
                if direction == "L" {
                    travelledNorth += Int(distance)!
                    pointing = "north"
                } else if direction == "R" {
                    travelledNorth -= Int(distance)!
                    pointing = "south"
                }
            } else if pointing == "south" {
                if direction == "L" {
                    travelledEast += Int(distance)!
                    pointing = "east"
                } else if direction == "R" {
                    travelledEast -= Int(distance)!
                    pointing = "west"
                }
            }
        }
        
        return abs(0-travelledEast) + abs(0-travelledNorth)
    }
}
