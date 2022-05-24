//
//  UITextField+Functional.swift
//  ReverseWords
//
//  Created by Roman Ivanov on 24.05.2022.
//

import Foundation
import UIKit

extension UITextField {
    func setOnTextChangeListener(onTextChanged :@escaping () -> Void) {
            self.addAction(UIAction { _ in
                onTextChanged()
            }, for: .editingChanged)
        }
}
