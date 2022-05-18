import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var reverseButton: ReverseButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reverseTextField: ReverseTextField!
    @IBOutlet weak var lineView: LineView!
    @IBOutlet weak var navBar: UINavigationBar! {
        didSet {
            navBar.hideNavBarLine()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        reverseTextField.delegate = self
    }

    @IBAction func reverseAction(_ sender: UIButton) {
        if reverseButton.isReversed {
            reverseButton.isReversed = false
            resultLabel.isHidden = true
            reverseTextField.text = ""
            reverseTextField.isActive = true
            lineView.isActive = true
            reverseButton.disableButton()
        } else {
            resultLabel.text = ReversePhrase.reverse(
                phrase: reverseTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines))
            resultLabel.isHidden = false
            reverseTextField.isActive = false
            lineView.isActive = false
            reverseButton.isReversed = true
        }
    }

    @IBAction func textFildEditingChanged(_ sender: UITextField) {
        reverseTextField.isActive = true
        lineView.isActive = true
        if sender.text?.count ?? 0 > 0 {
            reverseButton.enableButton()
        } else {
            reverseButton.disableButton()
        }
    }

}
