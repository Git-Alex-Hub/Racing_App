import Foundation
import UIKit

extension UIViewController {
    
    func addAlertAndReturn () {
        let alert = UIAlertController.init(title: locString(string: "title"), message: locString(string: "message"), preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: locString(string: "button"), style: .cancel, handler: { (_) in
        self.dismiss(animated: false, completion: {})
    }))
    self.present(alert, animated: true, completion: nil)
    }
    
    func changeFontLabel(label: UILabel, size: CGFloat) -> UILabel {
        label.font = UIFont(name: "Marck Script", size: size)
        return label
    }
    
    func changeFontButton(button: UIButton, size: CGFloat) -> UIButton {
        button.titleLabel?.font = UIFont(name: "Marck Script", size: size)
        return button
    }
    
    func locString (string: String) -> String {
        let locString = NSLocalizedString(string, comment: "")
        return locString
    }
}

extension UIView {
    
    func applyShadow (color: UIColor , opacity: Float = 1) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
    }
}
