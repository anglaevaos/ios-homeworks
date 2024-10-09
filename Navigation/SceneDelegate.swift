
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        let tabBarController = UITabBarController()
        
        let feedNavigationController = UINavigationController(rootViewController: FeedViewController())
        let profileNavigationController = UINavigationController(rootViewController: LogInViewController())
        
        
        feedNavigationController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house"), tag: 0)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 1)
        
        tabBarController.viewControllers = [feedNavigationController, profileNavigationController]
        
        //устанавливаем делегат
        
        let loginViewController = LogInViewController()
        let loginInspector = LoginInspector()
        
        loginViewController.loginDelegate = loginInspector
        window.rootViewController = loginViewController
        
        tabBarController.selectedIndex = 0
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
    
}

