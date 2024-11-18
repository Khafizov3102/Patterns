
import UIKit
import Combine

class ObserverExample: UIViewController {
    
    private var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .random()
        
        setupPublisher()
        
    }

    func setupPublisher() {
        // TODO: Events are published from here
        let timerPublisher = Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
        
        cancellable = timerPublisher.sink { [weak self] _ in
            self?.observeEvents()
        }
    }

    @objc func observeEvents() {
        // TODO: Events are observed here
        view.backgroundColor = .random()
    }
}
