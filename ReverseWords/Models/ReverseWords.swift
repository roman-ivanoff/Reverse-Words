import Foundation

class ReverseWords {
    static public func reverseString(str: String) -> String {
        return str.components(separatedBy: " ")
            .map { String($0.reversed()) }
            .joined(separator: " ")
    }
}
