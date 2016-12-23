import Foundation

enum planetYear {
    case earth, mercury, venus, mars, jupiter, saturn, uranus, neptune
    func inSeconds() -> Double {
        let earthValue:Double = 31557600
        switch self {
            case .earth: return earthValue
            case .mercury: return earthValue * 0.2408467
            case .venus: return earthValue * 0.61519726
            case .mars: return earthValue * 1.8808158
            case .jupiter: return earthValue * 11.862615
            case .saturn: return earthValue * 29.447498
            case .uranus: return earthValue * 84.016846
            case .neptune: return earthValue * 164.79132
        }
    }
}

struct SpaceAge {
    let seconds:Int
    
    init(_ seconds:Int) {
        self.seconds = seconds
    }
    
    func roundToPlaces(_ number:Double, _ decimals:Int) -> Double {
        let divisor = pow(10.0, Double(decimals))
        return (number * divisor).rounded() / divisor
    }
    
    func ageOnPlanet(_ planetYearInSeconds:Double) -> Double {
        let convertedSeconds = (Double(seconds) / planetYearInSeconds)
        return (100 * convertedSeconds).rounded() / 100
    }
    
    var onEarth:Double {
        get {
            return ageOnPlanet(planetYear.earth.inSeconds())
        }
    }
    
    var onMercury:Double {
        get {
            return ageOnPlanet(planetYear.mercury.inSeconds())
        }
    }
    
    var onVenus:Double {
        get {
            return ageOnPlanet(planetYear.venus.inSeconds())
        }
    }
    
    var onMars:Double {
        get {
            return ageOnPlanet(planetYear.mars.inSeconds())
        }
    }
    
    var onJupiter:Double {
        get {
            return ageOnPlanet(planetYear.jupiter.inSeconds())
        }
    }
    
    var onSaturn:Double {
        get {
            return ageOnPlanet(planetYear.saturn.inSeconds())
        }
    }
    
    var onUranus:Double {
        get {
            return ageOnPlanet(planetYear.uranus.inSeconds())
        }
    }
    
    var onNeptune:Double {
        get {
            return ageOnPlanet(planetYear.neptune.inSeconds())
        }
    }
}
