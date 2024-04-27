//
//  SceneDelegate.swift
//  lecture22
//
//  Created by MacBook Pro on 26.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        window?.rootViewController = UINavigationController(rootViewController: LogInScreen())
        window?.makeKeyAndVisible()
        
        //        let service = "CountryApp"
        //        let account = "username"
        //
        //        if KeyChainVC.credentialsAreSaved(service: service, account: account) {
        //            let mainScreen = MainScreen()
        //            let navigationController = UINavigationController(rootViewController: mainScreen)
        //            window?.rootViewController = navigationController
        //        } else {
        //            let loginScreen = LogInScreen()
        //            let navigationController = UINavigationController(rootViewController: loginScreen)
        //            window?.rootViewController = navigationController
        //        }
        //
        //        window?.makeKeyAndVisible()
        //    }
        //
        ////    private func isCredentialsSaved() -> Bool {
        //        return KeyChainVC.get(service: "CountryApp", account: "username") != nil &&
        //        KeyChainVC.get(service: "CountryApp", account: "password") != nil
        //    }
        //
        //    private func navigateToMainScreen() {
        //        let mainScreen = MainScreen()
        //        let navigationController = UINavigationController(rootViewController: mainScreen)
        //        window?.rootViewController = navigationController
        //    }
        
    }
    
}
