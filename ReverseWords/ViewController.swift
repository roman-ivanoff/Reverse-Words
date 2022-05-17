import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var reverseButton: ReverseButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var navBar: UINavigationBar! {
        didSet {
            navBar.hideNavBarLine()
        }
    }
    @IBOutlet weak var reverseTextFielld: ReverseTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func reverseAction(_ sender: UIButton) {
        if !reverseButton.isReversed {
            resultLabel.text = ReversePhrase.reverse(
                phrase: reverseTextFielld.text!.trimmingCharacters(in: .whitespacesAndNewlines))
            resultLabel.isHidden = false
            reverseTextFielld.isActive = false
            reverseButton.isReversed = true
        } else {
            reverseButton.isReversed = false
            resultLabel.isHidden = true
            reverseTextFielld.text = ""
            reverseTextFielld.isActive = true
            reverseButton.disableButton()
        }
    }

    @IBAction func textFildEditingChanged(_ sender: UITextField) {
        reverseTextFielld.isActive = true
        if sender.text?.count ?? 0 > 0 {
            reverseButton.enableButton()
        } else {
            reverseButton.disableButton()
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }

}
