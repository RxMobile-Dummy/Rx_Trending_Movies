//
//  HomeView.swift
//  RxManagement
//
//  Created by Devangi Prajapati on 08/07/22.
//

import UIKit

class HomeView: NSObject {

  //MARK: - intiallyLoadView Method
  /**
   Call this method for set intially load view functions.
   - Parameter vc : It is a object of HomeVC
   */
  func intiallyLoadView(vc: HomeVC)
  {
    /// set HomeVCTitle for HomeVC Screen
    setHomeVCTitle(vc: vc)
  }

  //MARK:- set HomeVCTitle Method
  /**
   Call this method for set HomeVC title
   - Parameter vc : It is a object of HomeVC
   */
  func setHomeVCTitle(vc: HomeVC)
  {
    vc.title = "Home"
    vc.navigationController?.isNavigationBarHidden = false
  }

}
