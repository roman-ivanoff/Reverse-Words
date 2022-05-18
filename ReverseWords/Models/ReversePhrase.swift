import Foundation

class ReversePhrase {
    static public func reverse(phrase: String) -> String {
        if phrase.isEmpty {
            return ""
        }

        return phrase.trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: " ")
            .map { String($0.reversed()) }
            .joined(separator: " ")
    }
}
