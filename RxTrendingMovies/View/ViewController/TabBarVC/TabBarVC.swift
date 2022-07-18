//
//  TabBarVC.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 07/07/22.
//

import UIKit

class TabBarVC: UITabBarController, UITabBarControllerDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
    self.tabBar.tintColor = Config.BTN_THEME_COLOR
    self.tabBar.barTintColor = .white
    self.tabBar.isTranslucent = true
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //navigationController?.navigationItem.rightBarButtonItem?.tintColor = Config.whiteColor
    //navigationController?.setNavigationBarHidden(false, animated: animated)
  }
}
