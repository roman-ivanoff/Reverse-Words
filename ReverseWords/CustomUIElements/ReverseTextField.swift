import UIKit
import Foundation

class ReverseTextField: UITextField {

    var isActive = false {
        didSet {
            if isActive {
                isUserInteractionEnabled = true
                becomeFirstResponder()
            } else {
                isUserInteractionEnabled = false
            }
        }
    }
}
