//
//  Utility.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 04/07/22.
//

import UIKit
import PKHUD
import SwiftyJSON
import Kingfisher

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
  
  
  class func getStoryboard() -> UIStoryboard? {
    return UIStoryboard(name: mainStoryboardName, bundle: nil)
  }
  
  //MARK:- Navigate to DashboardVC screen
  class func navigateToTabBarVC(window: UIWindow, isPush: Bool){
    let vc = Utility.getStoryboard()?.instantiateViewController(withIdentifier: "TabBarVCIdentifier") as! TabBarVC
    window.rootViewController = vc
    window.makeKeyAndVisible()
  }

  //MARK:- Navigate to DashboardVC screen
  class func navigateToLoginVC(window: UIWindow, isPush: Bool)
  {
    let vc = Utility.getStoryboard()?.instantiateViewController(withIdentifier: "loginVCIdentifier") //as! LoginVC
    window.rootViewController = vc
    window.makeKeyAndVisible()
  }

  //MARK:- Hud Show and Hide Method
  /**
   Call this method for showProgressView method
   */
  class func showProgressView()
  {
    DispatchQueue.main.async{
      HUD.show(.progress)
      HUD.hide(afterDelay: 60.0)
    }
  }
  /**
   Call this method for hideProgressView method
   */
  class func hideProgressView()
  {
    DispatchQueue.main.async{
      HUD.hide()
    }
  }

  class func convertModel<T: Encodable>(toJSON modelObject: T) -> JSON {
    if let data = try? JSONEncoder().encode(modelObject), let jsonData = try? JSON(data: data) {
      return jsonData
    }
    return JSON.null
  }

  //MARK: - set CustomNavigationBar Method
  class func SetCustomNavigationBar()
  {
    if #available(iOS 15, *) {
      let appearance = UINavigationBarAppearance()
      appearance.configureWithOpaqueBackground()
      appearance.backgroundColor = Config.BTN_THEME_COLOR
      appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),  NSAttributedString.Key.foregroundColor: Config.whiteColor]
      UINavigationBar.appearance().standardAppearance = appearance
      UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBar.appearance().standardAppearance
    }else{
      UINavigationBar.appearance().barTintColor = Config.BTN_THEME_COLOR
      UINavigationBar.appearance().titleTextAttributes = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),  NSAttributedString.Key.foregroundColor: Config.whiteColor]
    }
  }

  //MARK: - Animation Color Method
  /**
   Call this method for Animate Color of String
   - Parameter searchText: Object of String
   - Parameter lblMovie: Object of UILabel
   */
  class func animateColor(of searchText: String , lblMovie : UILabel) {
    UIView.transition(with: lblMovie, duration: 0.5, options: .transitionFlipFromLeft, animations: {
      lblMovie.textColor = UIColor.clear
      lblMovie.text = searchText
    }, completion: { _ in
      lblMovie.textColor = Config.BTN_THEME_COLOR
      lblMovie.textAlignment = .center
      lblMovie.font = Config.FONTBOLD24
      UIView.transition(with: lblMovie, duration: 1.5, options: .transitionFlipFromLeft, animations: {
        lblMovie.text = searchText
      })
    })
  }
}
