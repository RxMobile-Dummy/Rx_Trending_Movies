//
//  Utility.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 04/07/22.
//

import UIKit

class Utility: NSObject {
  
  //MARK: - set CustomAlert Show
  /**
   - Parameter title : String
   - Parameter message : String
   - Parameter delegate : AnyObject
   */
  class func alertShow(_ title : String , message :String, delegate: AnyObject?) {
    
    let alert = UIAlertController(title: title, message: message , preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
    delegate?.present(alert, animated: true, completion: nil)
  }
  
  // MARK:- Email validation
  /**
   Method for email validation.
   - Parameter strEmail: The strEmail parameter is an email string.
   - Returns: the bool value.
   */
  class func isValidEmail(_ strEmail:String) -> Bool
  {
    return NSPredicate(format: "SELF MATCHES %@", Config.kEMAILREGEX1).evaluate(with: strEmail)  && NSPredicate(format: "SELF MATCHES %@", Config.kEMAILREGEX2).evaluate(with: strEmail)
  }
  
  //MARK:- Password Validation
  /**
   Password Validation Function.
   
   - Parameter strPassword: The strPassword parameter is an password string.
   - Returns: the bool value.
   */
  class func isValidPassword(_ strPassword:String) -> Bool
  {
    //let passRegEx = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,24}$"
    let passRegEx = "^.{6,20}$"
    let passTest = NSPredicate(format: "SELF MATCHES %@", passRegEx)
    return passTest.evaluate(with: strPassword)
  }
  
  
  class func setStoryboard() -> UIStoryboard? {
    return UIStoryboard(name:  "Main", bundle: nil)
  }
  
  //MARK:- Navigate to DashboardVC screen
  class func navigateToTabBarVC(isPush: Bool)
  {

    var window = UIWindow()
    if #available(iOS 13, *) {
      let connectedScenes = UIApplication.shared.connectedScenes
        .filter { $0.activationState == .foregroundActive }
        .compactMap { $0 as? UIWindowScene }
      window = (connectedScenes.first?
                  .windows
                  .first { $0.isKeyWindow }) ?? UIWindow()

    } else {
      window =  UIApplication.shared.keyWindow!
    }

    guard let rootViewController = window.rootViewController else {
      return
    }

    let storyboard = UIStoryboard(name: "".storyboardName, bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVCIdentifier") as! TabBarVC
    let screenSize = UIScreen.main.bounds.size

    if isPush == true
    {
      rootViewController.view.frame.origin.x = screenSize.width / 3
    }
    else{
      rootViewController.view.frame.origin.x = -(screenSize.width / 3)
    }

    let navigationController:UINavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
    navigationController.viewControllers = [vc]
    navigationController.view.frame = rootViewController.view.frame

    if isPush == true
    {
      window.rootViewController = navigationController
    }
    else
    {
      UIView.transition(with: window, duration: 0.2, options: .curveLinear, animations: {
        rootViewController.view.frame.origin.x += screenSize.width / 3
        window.rootViewController = navigationController
      }, completion: { completed in
      })
    }
  }


  //MARK:- Navigate to DashboardVC screen
  class func navigateToLoginVC(isPush: Bool)
  {

    var window = UIWindow()

    if #available(iOS 13, *) {
      let connectedScenes = UIApplication.shared.connectedScenes
        .filter { $0.activationState == .foregroundActive }
        .compactMap { $0 as? UIWindowScene }
      window = (connectedScenes.first?
                  .windows
                  .first { $0.isKeyWindow }) ?? UIWindow()

    } else {
      window =  UIApplication.shared.keyWindow!
    }

    guard let rootViewController = window.rootViewController else {
      return
    }

    let storyboard = UIStoryboard(name: "".storyboardName, bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: kVIEWCONTROLLER_IDENTIFIER.loginVC) as! LoginVC
    let screenSize = UIScreen.main.bounds.size

    if isPush == true
    {
      rootViewController.view.frame.origin.x = screenSize.width / 3
    }
    else{
      rootViewController.view.frame.origin.x = -(screenSize.width / 3)
    }

    let navigationController:UINavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
    navigationController.viewControllers = [vc]
    navigationController.view.frame = rootViewController.view.frame

    if isPush == true
    {
      window.rootViewController = navigationController
    }
    else
    {
      UIView.transition(with: window, duration: 0.2, options: .curveLinear, animations: {
        rootViewController.view.frame.origin.x += screenSize.width / 3
        window.rootViewController = navigationController
      }, completion: { completed in
      })
    }
  }

  //MARK: - set CustomNavigationBar Method
  class func SetCustomNavigationBar()
  {
    UINavigationBar.appearance().barTintColor = Config.BTN_THEME_COLOR
    UINavigationBar.appearance().tintColor = Config.BTN_THEME_COLOR
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    UINavigationBar.appearance().isTranslucent = false
  }
}
