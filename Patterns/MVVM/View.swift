import UIKit

class View: UIViewController {

    let style = ButtonStyle()
    let viewModel: ViewModel = .init()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        bindViewModel()
        viewModel.loadData()
    }
}

private extension View {
    func setupUI() {
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: style.buttonWidth),
            label.heightAnchor.constraint(equalToConstant: style.buttonHeight)
        ])
    }
    
    func bindViewModel() {
        viewModel.labelProperties = { [weak self] properties in
            DispatchQueue.main.async {
                self?.updateUI(properties: properties)
            }
        }
        
    }
    
    func updateUI(properties: LabelProperties) {
        label.text = properties.title
        label.textColor = properties.color.withAlphaComponent(properties.alphaComponent)
    }
}
