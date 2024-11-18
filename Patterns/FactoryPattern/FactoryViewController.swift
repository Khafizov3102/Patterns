import UIKit

class FactoryViewController: UIViewController {

    private var buttonFactory: ButtonFactoryProtocol = ButtonFactory()
    let secondVc = SecondScreen()
    let style = ButtonStyle()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        let button = buttonFactory.createButton(title: "Button", color: .systemPink, cornerRadius: ButtonStyle.buttonCornerRadius)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: style.buttonWidth),
            button.heightAnchor.constraint(equalToConstant: style.buttonHeight)
        ])
    }
}

