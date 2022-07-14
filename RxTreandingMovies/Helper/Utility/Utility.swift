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
  
}
