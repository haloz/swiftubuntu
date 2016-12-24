import Foundation

struct Grains {
    static func square(_ value:Int) throws -> UInt64 {
        guard value > 0 else {
            throw GrainsError.inputTooLow(message: errorMessage(value: value))
        }
        guard value < 65 else {
            throw GrainsError.inputTooHigh(message: errorMessage(value: value))
        }
        return 1 << UInt64(value-1)
    }
    
    static var total:UInt64 {
        return UInt64.max
    }
    
    static func errorMessage(value:Int) -> String {
        return "Input[\(value)] invalid. Input should be between 1 and 64 (inclusive)"
    }
    
    enum GrainsError: Error {
        case inputTooHigh(message: String)
        case inputTooLow(message: String)
    }
}
