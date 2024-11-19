
import UIKit

class ViewModel {
    // TODO: ViewModel implementation goes here
    
    var labelProperties: ((LabelProperties) -> Void)?

    func loadData() {
        sendDataToView()
    }
    
    private func sendDataToView() {
        let properties = LabelProperties(title: "Task 1", color: .systemPink, alphaComponent: 0.8)
        self.labelProperties?(properties)
    }
}
