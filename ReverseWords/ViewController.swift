//
//  ViewController.swift
//  ReverseWords
//
//  Created by Roman Ivanov on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reverseButton: ReverseButton!
        @IBOutlet weak var reverseTextFielld: UITextField!
        @IBOutlet weak var resultLabel: UILabel!
        @IBOutlet weak var navBar: UINavigationBar!

        override func viewDidLoad() {
            super.viewDidLoad()

            hideNavBarLine()
        }

        @IBAction func reverseAction(_ sender: UIButton) {
            if !reverseButton.isReversed {
                resultLabel.text = ReverseWords.reverseString(
                    str: reverseTextFielld.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                resultLabel.isHidden = false
                reverseTextFielld.isUserInteractionEnabled = false
                reverseButton.setTitle(reverseButton.clear, for: .normal)
                reverseButton.isReversed = true
            } else {
                reverseButton.isReversed = false
                resultLabel.isHidden = true
                reverseTextFielld.text = ""
                reverseTextFielld.isUserInteractionEnabled = true
                reverseButton.setTitle(reverseButton.reserve, for: .normal)
                reverseTextFielld.becomeFirstResponder()
                reverseButton.disableButton()
            }
        }

        @IBAction func textFildEditingChanged(_ sender: UITextField) {
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

        private func hideNavBarLine() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowColor = .clear
            appearance.shadowImage = UIImage()
            navBar.standardAppearance = appearance
        }
}
