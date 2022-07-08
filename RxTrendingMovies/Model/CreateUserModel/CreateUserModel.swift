//
//  LoginModel.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 04/07/22.
//

import Foundation

// MARK: - CreateUserModel DataClass
class CreateUserModel
{
  var firstname: String?

  var lastname : String?

  var email : String?

  var mobilenumber : String?

  var password : String?

  var confirmpassword: String?
  
  init(firstname: String? = "" , lastname: String? = "", email : String? = "" , mobilenumber: String? = "", password: String? = "" , confirmpassword: String? = "") {
    self.firstname = firstname
    self.lastname = lastname
    self.email = email
    self.mobilenumber = mobilenumber
    self.password = password
    self.confirmpassword = confirmpassword
  }
}
