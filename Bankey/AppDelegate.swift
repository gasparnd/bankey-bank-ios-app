//
//  AppDelegate.swift
//  Bankey
//
//  Created by Gaspar Dolcemascolo on 27/10/2024.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let mainVC = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        
        let vc = mainVC
        vc.setStatusBar()
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = appColor
        
        window?.rootViewController = vc
        
        return true
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.4, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}

// MARK: Actions
extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboading {
            setRootViewController(mainVC)
        } else {
            setRootViewController(onboardingContainerViewController)
        }
        
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        setRootViewController(mainVC)
    }
}

extension AppDelegate: DummyViewControllerDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
}


