//
//  LoginViewModel.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 04/07/22.
//

import UIKit
import Firebase

class SignUpViewModel: NSObject {
  /**
   firebaseAuthService object call for Firebse Auth Service
   */
  static let firebaseAuthService = FirebaseAuthService()

  //MARK: - createUserSignUp Method
  /**
   Call this method for set intially load view functions.
   - Parameter createUser : It is a object of CreateUserModel
   - Parameter completion : It's using for call back
   */
  class func createUserSignUp(createUser : CreateUserModel , completion: @escaping (_ success: Bool , _ errorData : Error?) -> Void) {
    firebaseAuthService.createUser(createUserModel: createUser) { success , error  in
      if (success) {
        completion(true , nil)
      } else {
        completion(false , error)
      }
    }
  }
}
