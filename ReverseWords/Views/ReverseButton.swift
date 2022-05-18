import UIKit

class ReverseButton: UIButton {

    var isReversed = false {
        didSet {
            setTitle(isReversed ? "Clear" : "Reverse", for: .normal)
        }
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
