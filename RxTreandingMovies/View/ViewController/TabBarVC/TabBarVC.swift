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
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
}
