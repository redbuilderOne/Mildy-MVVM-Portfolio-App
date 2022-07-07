//
//  SceneDelegate.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 04.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
              window = UIWindow(frame: windowScene.coordinateSpace.bounds)
              window?.windowScene = windowScene
              window?.rootViewController = createTabBar()
              window?.makeKeyAndVisible()
    }

    func createSearchNavigationController() -> UINavigationController {
        let searchViewController = SearchViewController()
        searchViewController.title = "Search"
        searchViewController.tabBarItem.image = UIImage(systemName: "location.magnifyingglass")
        searchViewController.tabBarItem.selectedImage = UIImage(systemName:  "location.magnifyingglass.fill")
        return UINavigationController(rootViewController: searchViewController)
    }

    func createCurrentLocationNavigationController() -> UINavigationController {
        let currentLocationViewController = CurrentLocationViewController()
        currentLocationViewController.title = "Current"
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: cyangreen]
        currentLocationViewController.tabBarItem.image = UIImage(systemName:   "location")
        currentLocationViewController.tabBarItem.selectedImage = UIImage(systemName: "location.fill")
        return UINavigationController(rootViewController: currentLocationViewController)
    }

    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = pinky
        UITabBar.appearance().unselectedItemTintColor = transparentblue
        tabBar.viewControllers = [createCurrentLocationNavigationController(), createSearchNavigationController()]
        return tabBar
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
