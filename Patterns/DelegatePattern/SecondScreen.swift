import UIKit

class SecondScreen: UIViewController {
    
    let style = ButtonStyle()
    
    weak var delegate: ChangeBGColor?
    
    @AutoLayoutUsage private var changeColorButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .purple
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        config.attributedTitle = AttributedString("Change first screen color", attributes: container)
        let button = UIButton(configuration: config)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        addButtonAction()
    }
    
    private func setupUI() {
        view.addSubview(changeColorButton)
        
        NSLayoutConstraint.activate([
            changeColorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeColorButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            changeColorButton.widthAnchor.constraint(equalToConstant: style.buttonWidth),
            changeColorButton.heightAnchor.constraint(equalToConstant: style.buttonHeight)
        ])
    }
}

// MARK: Actions
private extension SecondScreen {
    func addButtonAction() {
        let action = UIAction { _ in
            self.buttonDidTap()
        }
        changeColorButton.addAction(action, for: .primaryActionTriggered)
    }
    
    func buttonDidTap() {
        delegate?.changeBGColor()
        dismiss(animated: true)
    }
}

