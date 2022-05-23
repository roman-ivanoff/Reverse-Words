import UIKit

class ViewController: UIViewController {
    enum ReverseState {
        case defaultReverse
        case customReverse
    }

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reverseTextField: ReverseTextField!
    @IBOutlet weak var navBar: UINavigationBar! {
        didSet {
            navBar.hideNavBarLine()
        }
    }
    @IBOutlet weak var viewWithLabel: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var charactersToIgnoreTextField: UITextField!
    @IBOutlet weak var viewWithTextField: UIView!

    private let model = ReversePhrase()
    private var reverseState: ReverseState = .defaultReverse {
        didSet {
            if reverseState == .defaultReverse {
                viewWithTextField.isHidden = true
                viewWithLabel.isHidden = false
                resultLabel.isHidden = true
            } else {
                viewWithLabel.isHidden = true
                viewWithTextField.isHidden = false
                resultLabel.isHidden = true
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        reverseTextField.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        view.endEditing(true)
    }

    @IBAction func switchBeetweenExclusionRules(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            reverseState = .defaultReverse
        } else {
            reverseState = .customReverse
        }
    }
    
    @IBAction func reverseAction(_ sender: UIButton) {
        switch reverseState {
        case .defaultReverse:
            resultLabel.text = model.reverse(phrase: reverseTextField.text!)
            resultLabel.isHidden = false
        case .customReverse:
            resultLabel.text = model.reverse(
                phrase: reverseTextField.text!,
                ignoredCharacters: charactersToIgnoreTextField.text!
            )
            resultLabel.isHidden = false
        }
    }
    
}
