//
//  CurrentVC.swift
//  Merchant
//
//  Created by Kian Digital on 7/16/18.
//  Copyright © 2018 Kian. All rights reserved.
//

import Foundation
import UIKit

//***
extension UIApplication {
  
  //**
  class func topVC(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    if let nav = base as? UINavigationController {
      let top = topVC(nav.visibleViewController)
      return top
    }
    
    if let tab = base as? UITabBarController {
      if let selected = tab.selectedViewController {
        let top = topVC(selected)
        return top
      }
    }
    
    if let presented = base?.presentedViewController {
      let top = topVC(presented)
      return top
    }
    return base
  }
  
  //**
  var visibleViewController: UIViewController? {
    return keyWindow?.rootViewController?.topViewController
  }
}

//***
extension UIViewController {
  
  //***
  var topViewController: UIViewController {
    switch self {
    case is UINavigationController:
      return (self as? UINavigationController)?.visibleViewController?.topViewController ?? self
    case is UITabBarController:
      return (self as? UITabBarController)?.selectedViewController?.topViewController ?? self
    default:
      return presentedViewController?.topViewController ?? self
    }
  }
  
}

//***
extension UIViewController {
  var previousVC: UIViewController? {
    if let controllersOnNavStack = self.navigationController?.viewControllers, controllersOnNavStack.count >= 2 {
      let number = controllersOnNavStack.count
      return controllersOnNavStack[number - 2]
    }
    return nil
  }
}

//**
extension UIViewController {
  
  var previousNavControllerVC: UIViewController? {

    if let navController = self.navigationController, navController.viewControllers.count >= 2 {
      let viewController = navController.viewControllers[navController.viewControllers.count - 2]
      return viewController
    }
    return nil
  }
}



