import UIKit

class ViewController: UIViewController {
    enum ReverseState {
        case defaultReverse
        case customReverse
    }

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reverseTextField: UITextField!
    @IBOutlet weak var navBar: UINavigationBar! {
        didSet {
            navBar.hideNavBarLine()
        }
    }
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var viewWithLabel: UIView!
    @IBOutlet weak var viewWithTextField: UIView!
    @IBOutlet weak var charactersToIgnoreTextField: UITextField!

    private let model = ReversePhrase()
    private var reverseState: ReverseState = .defaultReverse {
        didSet {
            if reverseState == .defaultReverse {
                viewWithTextField.isHidden = true
                viewWithLabel.isHidden = false
                defaultReverse()
            } else {
                viewWithLabel.isHidden = true
                viewWithTextField.isHidden = false
                customReverse()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        defaultReverse()
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
    
    private func defaultReverse() {
        setDefaultReverseLabel()
        reverseTextField.setOnTextChangeListener { [weak self] in
            self?.setDefaultReverseLabel()
        }
    }

    private func customReverse() {
        setCustomReverseLabel()
        self.charactersToIgnoreTextField.setOnTextChangeListener { [weak self] in
            self?.setCustomReverseLabel()
        }
    }

    private func setDefaultReverseLabel() {
        resultLabel.text = model.reverse(phrase: reverseTextField.text!)
    }

    private func setCustomReverseLabel() {
        resultLabel.text = model.reverse(
            phrase: reverseTextField.text!,
            ignoredCharacters: charactersToIgnoreTextField.text!
        )
    }
    
}
