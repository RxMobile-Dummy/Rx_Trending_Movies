//
//  loginValidation.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 06/07/22.
//

import Foundation
import Alamofire
import grpc

struct Validation {
  
  func checkEmptyAndValidEmailValidation(email : String?) -> String {
    if (email == "") {
      return ValidationError.emptyEmail.errorDescription ?? ""
    } else if (!Utility.isValidEmail(email ?? "")) {
      return ValidationError.validEmail.errorDescription ?? ""
    } else {
      return ""
    }
  }
  
  func checkEmptyAndValidPasswordValidation(password : String?)  -> String {
    if (password == "") {
      return ValidationError.emptyPassword.errorDescription ?? ""
    } else if (!Utility.isValidPassword(password ?? "")) {
      return ValidationError.validPassword.errorDescription ?? ""
    } else {
      return ""
    }
  }
  
  func checkEmptyAndValidConfirmPasswordValidation(confirmPassword : String? , password : String?) -> String {
    if (confirmPassword == "") {
      return ValidationError.emptyConfirmPassword.errorDescription ?? ""
    } else if (!Utility.isValidPassword(confirmPassword ?? "")) {
      return ValidationError.validConfirmPassword.errorDescription ?? ""
    } else if (password != confirmPassword) {
      return ValidationError.bothPasswordNotMatch.errorDescription ?? ""
    } else {
      return ""
    }
  }
}

enum ValidationError : LocalizedError {
  case emptyEmail
  case validEmail
  case emptyPassword
  case validPassword
  case emptyConfirmPassword
  case validConfirmPassword
  case bothPasswordNotMatch

  var errorDescription: String? {
    switch self {
    case .emptyEmail :
      return kMSG_PLEASE_ENTER_EMAIL
    case .validEmail:
      return kMSG_PLEASE_ENTER_VALID_EMAIL
    case .emptyPassword:
      return kMSG_PLEASE_ENTER_PASSWORD
    case .validPassword:
      return kMSG_PLEASE_ENTER_VALID_PASSWORD
    case .emptyConfirmPassword:
      return kMSG_PLEASE_ENTER_CONFRIM_PASSWORD
    case .validConfirmPassword:
      return kMSG_PLEASE_ENTER_VALID_CONFIRM_PASSWORD
    case .bothPasswordNotMatch:
      return kMSG_PASSWORD_CONFIRMPASSWORD_DO_NOT_MATCH
    }
  }
}
