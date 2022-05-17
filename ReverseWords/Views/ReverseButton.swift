import UIKit

@IBDesignable
class ReverseButton: UIButton {

    var isReversed = false {
        didSet {
            !isReversed ? setTitle("Reverse", for: .normal) : setTitle("Clear", for: .normal)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public func disableButton() {
        isUserInteractionEnabled = false
        alpha = 0.6
    }

    public func enableButton() {
        isUserInteractionEnabled = true
        alpha = 1.0
    }

    private func setup() {
        disableButton()
        titleLabel?.font = UIFont(name: "Roboto-Regular", size: 17)!
        layer.cornerRadius = 10.0
    }
}
