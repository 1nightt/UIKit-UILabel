import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let firstVC = UINavigationController(rootViewController: FirstSettingsViewController())
        firstVC.title = "Label View"
        let secondVC = UINavigationController(rootViewController: SettingsViewController())
        secondVC.title = "Other Settings"
        
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([firstVC, secondVC], animated: true)
        firstVC.tabBarItem.image = UIImage(systemName: "heart.text.square")
        secondVC.tabBarItem.image = UIImage(systemName: "hammer")
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarVC
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}

