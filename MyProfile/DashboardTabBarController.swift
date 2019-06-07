//
//  DashboardTabBarController.swift
//  MyProfile
//
//   on 5/24/19.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import UIKit

class DashboardTabBarController: UITabBarController, UITabBarControllerDelegate {
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    loadTabs()
  }

  //Delegate methods
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    return true;
  }

  func loadTabs() {
    let profileModule = ProfileWireFrame.buildProfileModule()
    let profileBarItem = UITabBarItem(title: "ABOUT ME", image: nil, selectedImage: nil)

    let knowledgeModule = KnowledgeWireFrame.buildKnowledgeModule()
    let knowledgeBarItem = UITabBarItem(title: "KNOWLEDGE", image: nil, selectedImage: nil)

    let experienceModule = ExperienceWireFrame.buildExperienceModule()
    let experienceBarItem = UITabBarItem(title: "EXPERIENCE", image: nil, selectedImage: nil)

    let tabBarItems = [profileBarItem, knowledgeBarItem, experienceBarItem]
    let modules = [profileModule, knowledgeModule, experienceModule]
    let controllers = modules.compactMap { $0 as? UIViewController }  //array of the root view controllers displayed by the tab bar interface
    zip(tabBarItems, controllers).forEach { (tabBarItem, controller) in
      controller.tabBarItem = tabBarItem
    }
    self.viewControllers = controllers

  }
}
