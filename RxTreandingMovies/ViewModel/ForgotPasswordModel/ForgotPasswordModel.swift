//
//  ForgotPasswordModel.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 06/07/22.
//

import UIKit

class ForgotPasswordModel: NSObject {

  /**
   firebaseAuthService object call for Firebse Auth Service
   */
  static let firebaseAuthService = FirebaseAuthService()

  //MARK: - forgotPassword Method
  /**
   Call this method for set intially load view functions.
   - Parameter createUser : It is a object of CreateUserModel
   - Parameter completion : It's using for call back
   */
  class func forgotPassword(createUser : CreateUserModel , completion: @escaping (_ success: Bool , _ errorData : Error?) -> Void) {
    firebaseAuthService.forgotPassword(createUserModel: createUser) { success, error in
      if(success == true && error == nil) {
        completion(true , error)
      } else {
        completion(true , error)
      }
    }
  }
}
