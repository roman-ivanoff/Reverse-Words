import Foundation
import UIKit

class LineView: UIView {

    var isActive = false {
        didSet {
            if isActive {
                UIView.animate(withDuration: 0.23) {
                    self.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                }
            } else {
                UIView.animate(withDuration: 0.23) {
                    self.backgroundColor = #colorLiteral(red: 0.07843137255, green: 0.1294117647, blue: 0.1294117647, alpha: 0.2)
                }
            }
        }
    }
}
