import UIKit

/// Экран с доп настройками, но он пуст
final class SettingsViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Второй экран"
        view.backgroundColor = .white
    }

}
