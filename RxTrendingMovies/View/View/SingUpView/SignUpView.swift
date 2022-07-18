//
//  SignUpViewModel.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 01/07/22.
//

import UIKit

class SignUpView: NSObject {

  /// validation object of Validation
  static  let validation = Validation()

  //MARK: - intiallyLoadView Method
  /**
   Call this method for set intially load view functions.
   - Parameter vc : It is a object of SignUpVC
   */
  func intiallyLoadView(vc: SignUpVC)
  {
    /// set setSingUpVCTitle for SignUpVC Screen
    setSingUpVCTitle(vc: vc)
    /// set TextFieldPlaceHolder for SignUpVC Screen
    setTextFieldPlaceHoder(vc: vc)
    /// set Navigation Button  for SignUpVC Screen
    setNavigationButton(vc: vc)
  }

  //MARK:- set setSingUpVCTitle Method
  /**
   Call this method for set signUpVC title
   - Parameter vc : It is a object of SignUpVC
   */
  func setSingUpVCTitle(vc: SignUpVC)
  {
    vc.title = kBTN_SIGNUP
    vc.navigationController?.isNavigationBarHidden = false
    vc.navigationItem.hidesBackButton = true

  }

  //MARK:- SetNavigation Back Button Method
  /**
   Call this method for set navigation back button action
   - Parameter vc : It is a object of SignUpVC
   */
  func setNavigationButton(vc : SignUpVC)
  {
    let button = vc.setCustomNavigationBack(isLeft: true, text: "")
    button.addTarget(vc, action:#selector(vc.backAction), for: UIControl.Event.touchUpInside)
  }

  //MARK:- set TextFieldPlaceHolder Method
  /**
   Call this method for set textfield placeholder.
   - Parameter vc : It is a object of SignUpVC
   */
  func setTextFieldPlaceHoder(vc: SignUpVC) {

    CustomTextField.setCustomTextfield(textField: vc.txtFName, textFieldFont: Config.FONTREGULAR14, textFieldText: "", textFieldTextColor: Config.BlackColor, textFieldTextAligenment: .left, textFieldPlaceHolder: kTEXTFIELD_ENTER_FNAME, textFieldTintColor: Config.BlackColor, isTextFieldBorder: false, textFieldBorderColor: Config.ClearColor, textFieldBorderWidth: 0.0, isTextFieldLeftView: true, textFieldLeftViewBgColor: Config.ClearColor, textFieldLeftViewMode: .always)

    CustomTextField.setCustomTextfield(textField: vc.txtLName, textFieldFont: Config.FONTREGULAR14, textFieldText: "", textFieldTextColor: Config.BlackColor, textFieldTextAligenment: .left, textFieldPlaceHolder: kTEXTFIELD_ENTER_LNAME, textFieldTintColor: Config.BlackColor, isTextFieldBorder: false, textFieldBorderColor: Config.ClearColor, textFieldBorderWidth: 0.0, isTextFieldLeftView: true, textFieldLeftViewBgColor: Config.ClearColor, textFieldLeftViewMode: .always)

    CustomTextField.setCustomTextfield(textField: vc.txtEmail, textFieldFont: Config.FONTREGULAR14, textFieldText: "", textFieldTextColor: Config.BlackColor, textFieldTextAligenment: .left, textFieldPlaceHolder: kTEXTFIELD_ENTER_EMAIL, textFieldTintColor: Config.BlackColor, isTextFieldBorder: false, textFieldBorderColor: Config.ClearColor, textFieldBorderWidth: 0.0, isTextFieldLeftView: true, textFieldLeftViewBgColor: Config.ClearColor, textFieldLeftViewMode: .always)

    CustomTextField.setCustomTextfield(textField: vc.txtMobileNumber, textFieldFont: Config.FONTREGULAR14, textFieldText: "", textFieldTextColor: Config.BlackColor, textFieldTextAligenment: .left, textFieldPlaceHolder: kTEXTFIELD_ENTER_MOBILE_NUMBER, textFieldTintColor: Config.BlackColor, isTextFieldBorder: false, textFieldBorderColor: Config.ClearColor, textFieldBorderWidth: 0.0, isTextFieldLeftView: true, textFieldLeftViewBgColor: Config.ClearColor, textFieldLeftViewMode: .always)

    CustomTextField.setCustomTextfield(textField: vc.txtPassword, textFieldFont: Config.FONTREGULAR14, textFieldText: "", textFieldTextColor: Config.BlackColor, textFieldTextAligenment: .left, textFieldPlaceHolder: kTEXTFIELD_ENTER_PASSWORD , textFieldTintColor: Config.BlackColor, isTextFieldBorder: false, textFieldBorderColor: Config.ClearColor, textFieldBorderWidth: 0.0, isTextFieldLeftView: true, textFieldLeftViewBgColor: Config.ClearColor, textFieldLeftViewMode: .always)

    CustomTextField.setCustomTextfield(textField: vc.txtConfirmPassword, textFieldFont: Config.FONTREGULAR14, textFieldText: "", textFieldTextColor: Config.BlackColor, textFieldTextAligenment: .left, textFieldPlaceHolder: kTEXTFIELD_ENTER_CONFIRM_PASSWORD , textFieldTintColor: Config.BlackColor, isTextFieldBorder: false, textFieldBorderColor: Config.ClearColor, textFieldBorderWidth: 0.0, isTextFieldLeftView: true, textFieldLeftViewBgColor: Config.ClearColor, textFieldLeftViewMode: .always)

  }

  //MARK:- TextField Begin Editing Method
  /**
   Call this method for textfield begin editing method
   - Parameter textfield : It is a object of UITextField
   - Parameter vc : It is a object of SignUpVC
   - Returns: Bool
   */
  func setTextFieldBeginEditing(textfield : UITextField , vc : SignUpVC) -> Bool
  {
    textfield.inputView = nil
    textfield.placeholder = ""
    switch textfield.tag
    {
    case 3:
      textfield.keyboardType = .numberPad
    default:
      textfield.keyboardType = .default
    }
    return true
  }
  /**
   Call this method for set text field end editing method
   - Parameter textfield : It is a object of UITextField
   - Parameter vc : It is a object of SignUpVC
   */
  func setTextFieldEndEditing(textfield : UITextField , vc : SignUpVC)
  {
    if(textfield.text !=  "") {
      setTextIntoArray(textField: textfield, vc: vc)
    } else {
      setEmptyString(textField: textfield, vc: vc)
    }
  }

  //MARK: - setTextIntoArray Method
  /**
   Call this method for set array
   - Parameter textField : It is a object of UITextField
   - Parameter vc : It is a object of SignUpVC
   */
  func setEmptyString(textField : UITextField , vc : SignUpVC)
  {
    switch textField.tag
    {
    case 0:
      textField.placeholder = kTEXTFIELD_ENTER_FNAME
    case 1:
      textField.placeholder = kTEXTFIELD_ENTER_LNAME
    case 2:
      textField.placeholder = kTEXTFIELD_ENTER_EMAIL
    case 3:
      textField.placeholder = kTEXTFIELD_ENTER_MOBILE_NUMBER
    case 4:
      textField.placeholder = kTEXTFIELD_ENTER_PASSWORD
    case 5:
      textField.placeholder = kTEXTFIELD_ENTER_CONFIRM_PASSWORD
    default:
      break
    }
  }

  //MARK: - setTextIntoArray Method
  /**
   Call this method for set array
   - Parameter textField : It is a object of UITextField
   - Parameter vc : It is a object of SignUpVC
   */
  func setTextIntoArray(textField : UITextField , vc : SignUpVC)
  {
    switch textField.tag
    {
    case 0:
      vc.createUser.firstname = textField.text!
    case 1:
      vc.createUser.lastname = textField.text!
    case 2:
      vc.createUser.email = textField.text!
    case 3:
      vc.createUser.mobilenumber = textField.text!
    case 4:
      vc.createUser.password  = textField.text!
    case 5:
      vc.createUser.confirmpassword  = textField.text!
    default:
      break
    }
  }

  //MARK: - set Validation for SignUpVC Screen
  /**
   Call this method for login validation
   - Parameter vc : It is a object of SignUpVC
   - Returns: Bool
   */
  func checkValidationForLogin(vc : SignUpVC) -> Bool {
    var validateForm : Bool = true
    vc.view.endEditing(true)
    if vc.createUser.email == ""{
      validateForm = false
      Utility.alertShow(kALERT, message: kMSG_PLEASE_ENTER_EMAIL , delegate: vc as AnyObject)
    } else if !Utility.isValidEmail(vc.createUser.email ?? "") {
      validateForm = false
      Utility.alertShow(kALERT, message: kMSG_PLEASE_ENTER_VALID_EMAIL , delegate: vc as AnyObject)
    } else if vc.createUser.password == "" {
      validateForm = false
      Utility.alertShow(kALERT, message: kMSG_PLEASE_ENTER_PASSWORD , delegate: vc as AnyObject)
    } else if !Utility.isValidPassword(vc.createUser.password ?? ""){
      validateForm = false
      Utility.alertShow(kALERT, message: kMSG_PLEASE_ENTER_VALID_PASSWORD , delegate: vc as AnyObject)
    } else if vc.createUser.confirmpassword == "" {
      validateForm = false
      Utility.alertShow(kALERT, message: kMSG_PLEASE_ENTER_CONFRIM_PASSWORD , delegate: vc as AnyObject)
    } else if !Utility.isValidPassword(vc.createUser.confirmpassword ?? "" ){
      validateForm = false
      Utility.alertShow(kALERT, message: kMSG_PLEASE_ENTER_VALID_CONFIRM_PASSWORD , delegate: vc as AnyObject)
    } else if (vc.createUser.password != vc.createUser.confirmpassword ) {
      validateForm = false
      Utility.alertShow(kALERT,  message: kMSG_PASSWORD_CONFIRMPASSWORD_DO_NOT_MATCH , delegate: vc as AnyObject)
    }
    return validateForm
  }
    
    func navigateToHomeVC(vc : SignUpVC) {
      DispatchQueue.main.async {
          Utility.navigateToTabBarVC(window: sceneDelegate.window!, isPush: true)
      }
    }
}
