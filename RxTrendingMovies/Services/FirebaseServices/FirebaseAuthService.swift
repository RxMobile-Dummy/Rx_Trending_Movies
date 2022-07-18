//
//  FirebaseAuthService.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 04/07/22.
//

import UIKit
import Firebase

class FirebaseAuthService: NSObject {
  
  static let firebaseAuth = Auth.auth()
  
  func createUser(createUserModel : CreateUserModel , completionBlock: @escaping (_ success: Bool , _ errorData : Error?) -> Void) {
    FirebaseAuthService.firebaseAuth.createUser(withEmail: createUserModel.email ?? "", password: createUserModel.password ?? "") {(authResult, error) in
      if let user = authResult?.user {
        completionBlock(true , error)
      } else {
        completionBlock(false , error)
      }
    }
  }
  
  func signInUser(createUserModel : CreateUserModel , completionBlock: @escaping (_ success: Bool , _ user : User? , _ errorData : Error?) -> Void) {
    FirebaseAuthService.firebaseAuth.signIn(withEmail: createUserModel.email ?? "", password: createUserModel.password ?? "", completion: { authResult, error in
      let user = authResult?.user
      if(user != nil) {
        completionBlock(true , user! , nil)
      } else {
        completionBlock(false , user , error)
      }
    })
  }

  func forgotPassword(createUserModel : CreateUserModel , completionBlock: @escaping (_ success: Bool , _ errorData : Error?) -> Void) {
    FirebaseAuthService.firebaseAuth.sendPasswordReset(withEmail: createUserModel.email ?? "") { error in
      if error != nil{
        completionBlock(true , error)
      }else {
        completionBlock(false , error)
      }
    }
  }
}
