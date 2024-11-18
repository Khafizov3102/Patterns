import UIKit

protocol ChangeBGColor: AnyObject {
    func changeBGColor()
}

class FirstScreen: UIViewController {

    let secondVc = SecondScreen()
    let style = ButtonStyle()

   @AutoLayoutUsage private var presentScreenButton: UIButton = {
       var config = UIButton.Configuration.filled()
       config.baseBackgroundColor = .systemBlue
       config.baseForegroundColor = .white
       config.buttonSize = .large
       config.cornerStyle = .medium
       var container = AttributeContainer()
       container.font = UIFont.systemFont(ofSize: 16, weight: .bold)
       config.attributedTitle = AttributedString("Go to second screen", attributes: container)
       let button = UIButton(configuration: config)
       return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        addButtonAction()
        
        secondVc.delegate = self
    }

    private func setupUI() {
        view.addSubview(presentScreenButton)

        NSLayoutConstraint.activate([
            presentScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentScreenButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            presentScreenButton.widthAnchor.constraint(equalToConstant: style.buttonWidth),
            presentScreenButton.heightAnchor.constraint(equalToConstant: style.buttonHeight)
        ])
    }
}

// MARK: Actions
private extension FirstScreen {
    func addButtonAction() {
        let action = UIAction { _ in
            self.buttonDidTap()
        }
        presentScreenButton.addAction(action, for: .primaryActionTriggered)
    }

    func buttonDidTap() {
        present(secondVc, animated: true)
    }
}

extension FirstScreen: ChangeBGColor {
    func changeBGColor() {
        view.backgroundColor = .random()
    }
}

