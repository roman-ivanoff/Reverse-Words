import UIKit

extension UINavigationBar {
    func hideNavBarLine() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()
        standardAppearance = appearance
    }
}
