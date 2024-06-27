import UIKit

/// Экран с доп настройками, но он пуст
final class SettingsViewController: UIViewController {
    private enum Constants {
        static let backgroundColor: UIColor = .white
        static let title = "Второй экран"
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        navigationItem.title = Constants.title
    }

}
