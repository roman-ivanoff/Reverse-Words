import UIKit

@IBDesignable
class ReverseButton: UIButton {

    let clear = "Clear"
    let reserve = "Reverse"
    var isReversed = false

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public func disableButton() {
        self.isUserInteractionEnabled = false
        self.alpha = 0.6
    }

    public func enableButton() {
        self.isUserInteractionEnabled = true
        self.alpha = 1.0
    }

    private func setup() {
        self.disableButton()
        self.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 17)!
        self.layer.cornerRadius = 10.0
    }
}
