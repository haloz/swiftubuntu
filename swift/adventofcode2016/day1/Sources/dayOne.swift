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
    
    static func twiceVisited(_ instructions:String) -> Int {
        var travelledNorth = 0
        var travelledEast = 0
        var pointing = "north"
        var visitedLocations = [String]()
        
        visitedLocations.append("N0E0")
        
        for step in instructions.components(separatedBy: ", ") {
            let indexFirstChar = step.index(step.startIndex, offsetBy: 1)
            let direction = step.substring(to: indexFirstChar)
            let distance = step.substring(from: indexFirstChar)
            
            if pointing == "north" {
                if direction == "L" {
                    for _ in (1...Int(distance)!) {
                        travelledEast -= 1
                        let visited = "E\(travelledEast)N\(travelledNorth)"
                        if visitedLocations.contains(visited) {
                            return abs(0-travelledEast) + abs(0-travelledNorth)
                        }
                        visitedLocations.append(visited)
                    }
                    pointing = "west"
                } else if direction == "R" {
                    for _ in (1...Int(distance)!) {
                        travelledEast += 1
                        let visited = "E\(travelledEast)N\(travelledNorth)"
                        if visitedLocations.contains(visited) {
                            return abs(0-travelledEast) + abs(0-travelledNorth)
                        }
                        visitedLocations.append(visited)
                    }
                    pointing = "east"
                }
            } else if pointing == "west" {
                if direction == "L" {
                    for _ in (1...Int(distance)!) {
                        travelledNorth -= 1
                        let visited = "E\(travelledEast)N\(travelledNorth)"
                        if visitedLocations.contains(visited) {
                            return abs(0-travelledEast) + abs(0-travelledNorth)
                        }
                        visitedLocations.append(visited)
                    }
                    pointing = "south"
                } else if direction == "R" {
                    for _ in (1...Int(distance)!) {
                        travelledNorth += 1
                        let visited = "E\(travelledEast)N\(travelledNorth)"
                        if visitedLocations.contains(visited) {
                            return abs(0-travelledEast) + abs(0-travelledNorth)
                        }
                        visitedLocations.append(visited)
                    }
                    pointing = "north"
                }
            } else if pointing == "east" {
                if direction == "L" {
                    for _ in (1...Int(distance)!) {
                        travelledNorth += 1
                        let visited = "E\(travelledEast)N\(travelledNorth)"
                        if visitedLocations.contains(visited) {
                            return abs(0-travelledEast) + abs(0-travelledNorth)
                        }
                        visitedLocations.append(visited)
                    }
                    pointing = "north"
                } else if direction == "R" {
                    for _ in (1...Int(distance)!) {
                        travelledNorth -= 1
                        let visited = "E\(travelledEast)N\(travelledNorth)"
                        if visitedLocations.contains(visited) {
                            return abs(0-travelledEast) + abs(0-travelledNorth)
                        }
                        visitedLocations.append(visited)
                    }
                    pointing = "south"
                }
            } else if pointing == "south" {
                if direction == "L" {
                    for _ in (1...Int(distance)!) {
                        travelledEast += 1
                        let visited = "E\(travelledEast)N\(travelledNorth)"
                        if visitedLocations.contains(visited) {
                            return abs(0-travelledEast) + abs(0-travelledNorth)
                        }
                        visitedLocations.append(visited)
                    }
                    pointing = "east"
                } else if direction == "R" {
                    for _ in (1...Int(distance)!) {
                        travelledEast -= 1
                        let visited = "E\(travelledEast)N\(travelledNorth)"
                        if visitedLocations.contains(visited) {
                            return abs(0-travelledEast) + abs(0-travelledNorth)
                        }
                        visitedLocations.append(visited)
                    }
                    pointing = "west"
                }
            }
        }
        return 0
    }
}
