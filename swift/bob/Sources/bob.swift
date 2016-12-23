import Foundation

struct Bob {
    static func hey(_ input:String) -> String {
        if input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return "Fine, be that way."
        }
        else if input.uppercased() == input && input.lowercased() != input {
            return "Woah, chill out!"
        }
        else if input.hasSuffix("?") {
            return "Sure."
        }
        return "Whatever."
    }
}
