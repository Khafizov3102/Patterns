
import UIKit

protocol ButtonFactoryProtocol {
    // TODO: Factory protocol implementation goes here
    func makeButton(title: String, color: UIColor, cornerRadius: CGFloat) -> UIButton
}

class ButtonFactory: ButtonFactoryProtocol {
    // TODO: Factory implementation goes here
    
    func makeButton(title: String, color: UIColor, cornerRadius: CGFloat) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.layer.cornerRadius = cornerRadius
        button.setTitleColor(.white, for: .normal)
        return button
    }
}

