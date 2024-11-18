
import UIKit

class ViewModel {
    // TODO: ViewModel implementation goes here
    
    var labelProperties: ((LabelProperties) -> Void)?

    init() {
        sendDataToView()
    }

    private func sendDataToView() {
        let properties = LabelProperties(title: "Task 1", color: .systemPink, alphaComponent: 0.8)
        DispatchQueue.main.async {
            self.labelProperties?(properties)
        }
    }
}
