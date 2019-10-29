//
//  Storyboards.swift
//  CustomNavBarTest
//
//  Created by Arash Goodarzi on 8/22/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case main = "Main"
    case home = "Home"
    
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        guard let viewController = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            return T()
        }
        return viewController
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    class var storyboardID: String {
        return "\(self)"
        
    }
    
    static func instantiateFromStoryboard(storyboard: Storyboard) -> Self {
        return storyboard.viewController(viewControllerClass: self)
    }
}
