import UIKit
import Foundation

@IBDesignable
class ReverseTextField: UITextField {
    let bottomLine = CALayer()

    var isActive = false {
        didSet {
            if !isActive {
                isUserInteractionEnabled = false
                borderColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1).cgColor.copy(alpha: 0.2)!
            } else {
                isUserInteractionEnabled = true
                becomeFirstResponder()
                borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            }
        }
    }
    var borderColor: CGColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1).cgColor.copy(alpha: 0.2)!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        bottomLine.removeFromSuperlayer()
        addBottomBorder(color: borderColor)

    }

    func addBottomBorder(color: CGColor) {
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height + 17.5, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = color
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
