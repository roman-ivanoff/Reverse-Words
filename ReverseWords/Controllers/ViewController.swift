import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reverseTextField: ReverseTextField!
    @IBOutlet weak var navBar: UINavigationBar! {
        didSet {
            navBar.hideNavBarLine()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        reverseTextField.delegate = self
    }

    @IBAction func textFildEditingChanged(_ sender: UITextField) {
        reverseTextField.isActive = true
        if sender.text?.count ?? 0 > 0 {
//            reverseButton.enableButton()
        } else {
//            reverseButton.disableButton()
        }
    }

}
