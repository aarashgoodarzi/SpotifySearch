//
//  NAvigationControllerrr.swift
//  KianBussiness
//
//  Created by Arash Goodarzi on 1/23/19.
//  Copyright © 2019 Arash Goodarzi. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
  
  
  var statusBarStyle: UIStatusBarStyle = .lightContent {
    didSet {
      self.setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return statusBarStyle
  }
  
  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
    return .fade
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationBarSetting()
    self.setShadow()
    self.navigationBar.topItem?.title = "sdfdfgfdg"
  }
  
  //**
  private func setShadow() {
    self.navigationBar.layer.masksToBounds = false
    self.navigationBar.layer.shadowColor = UIColor.white.cgColor
    self.navigationBar.layer.shadowOpacity = 0.3
    self.navigationBar.layer.shadowRadius = 2.0
    self.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 1.0)
  }


  //**
  func navigationBarSetting() {
    
    let navBarAppearance = UINavigationBar.appearance()
    navBarAppearance.tintColor = .white
    navBarAppearance.barTintColor = .navBarColor
    navBarAppearance.backgroundColor = .navBarColor
   
    //hide nav bar border
    navBarAppearance.shadowImage = UIImage()
    
    //hide back item title
    UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    
  }
  
  
}
