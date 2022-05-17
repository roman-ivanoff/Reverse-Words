import Foundation

class ReversePhrase {
    static public func reverse(phrase: String) -> String {
        phrase.components(separatedBy: " ")
            .map { String($0.reversed()) }
            .joined(separator: " ")
    }
}
