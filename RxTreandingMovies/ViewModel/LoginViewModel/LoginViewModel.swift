//
//  LoginViewModel.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 04/07/22.
//

import UIKit
import Firebase

class LoginViewModel: NSObject {

  /**
   firebaseAuthService object call for Firebse Auth Service
   */
  static let firebaseAuthService = FirebaseAuthService()

  //MARK: - signIn Method
  /**
   Call this method for set intially load view functions.
   - Parameter createUser : It is a object of CreateUserModel
   - Parameter completion : It's using for call back
   */
  class func signIn(createUser : CreateUserModel , completion: @escaping (_ success: Bool , _ user : User? , _ errorData : Error?) -> Void) {
    firebaseAuthService.signInUser(createUserModel: createUser){ success, data, error    in
      if (success) {
        completion(true , data, nil)
      } else {
        completion(false , data , error)
      }
    }
  }
}
