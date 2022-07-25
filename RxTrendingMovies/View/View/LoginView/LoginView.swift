//
//  LoginViewModel.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 30/06/22.
//

import UIKit

class LoginView: NSObject {

  static  let validation = Validation()
  
  //MARK: - intiallyLoadView Method
  /**
   Call this method for set intially load view functions.
   - Parameter vc : It is a object of LoginVC
   */
   func intiallyLoadView(vc: LoginVC)
  {
    /// set LoginVCTitle for LoginViewController Screen
    setLoginVCTitle(vc: vc)
  }
  
  //MARK:- set LoginVCTitle Method
  /**
   Call this method for set loginVC title
   - Parameter vc : It is a object of LoginVC
   */
  func setLoginVCTitle(vc: LoginVC)
  {
    vc.navigationController?.isNavigationBarHidden = true
    
    CustomButton.setBtnFontTitleBgColorTintColorWithImage(btn: vc.btnLogin, andImgOfButton: "", andIsImage: false, andIsOnlyImageNoTintColor: false, andBtnTintColor: Config.whiteColor, andBtnTitle: kBTN_LOGIN, andBtnTitleColor: Config.whiteColor, andBtnFont: Config.FONTBOLD16, andBtnBgColor: Config.BTN_THEME_COLOR, andBtnContentMode: .center, andBtnCornerRadius: 10.0, andBtnBorderColor: Config.ClearColor, andBtnBorderWidth: 0.0, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping, lblTextAlignMent: .center)
    
    CustomButton.setBtnFontTitleBgColorTintColorWithImage(btn: vc.btnForgotPassword, andImgOfButton: "", andIsImage: false, andIsOnlyImageNoTintColor: false, andBtnTintColor: Config.BTN_THEME_COLOR, andBtnTitle: kBTN_FORGOTPASSWORD, andBtnTitleColor: Config.BTN_THEME_COLOR, andBtnFont: Config.FONTBOLD16, andBtnBgColor: Config.ClearColor, andBtnContentMode: .center, andBtnCornerRadius: 0.0, andBtnBorderColor: Config.ClearColor, andBtnBorderWidth: 0.0, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping, lblTextAlignMent: .center)
    
    CustomButton.setBtnFontTitleBgColorTintColorWithImage(btn: vc.btnSignUp, andImgOfButton: "", andIsImage: false, andIsOnlyImageNoTintColor: false, andBtnTintColor: Config.whiteColor, andBtnTitle: kBTN_SIGNUP, andBtnTitleColor: Config.whiteColor, andBtnFont: Config.FONTBOLD16, andBtnBgColor: Config.BTN_THEME_COLOR, andBtnContentMode: .left, andBtnCornerRadius: 10.0, andBtnBorderColor: Config.ClearColor, andBtnBorderWidth: 0.0, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping, lblTextAlignMent: .left)
    
    CustomTextField.setCustomTextfield(textField: vc.emailTextField, textFieldFont: Config.FONTREGULAR14, textFieldText: "", textFieldTextColor: Config.BlackColor, textFieldTextAligenment: .left, textFieldPlaceHolder: kTEXTFIELD_ENTER_EMAIL, textFieldTintColor: Config.BlackColor, isTextFieldBorder: false, textFieldBorderColor: Config.ClearColor, textFieldBorderWidth: 0.0, isTextFieldLeftView: true, textFieldLeftViewBgColor: Config.ClearColor, textFieldLeftViewMode: .always)
    
    vc.passWordTextField.isSecureTextEntry = true
    CustomTextField.setCustomTextfield(textField: vc.passWordTextField, textFieldFont: Config.FONTREGULAR14, textFieldText: "", textFieldTextColor: Config.BlackColor, textFieldTextAligenment: .left, textFieldPlaceHolder: kTEXTFIELD_ENTER_PASSWORD, textFieldTintColor: Config.BlackColor, isTextFieldBorder: false, textFieldBorderColor: Config.ClearColor, textFieldBorderWidth: 0.0, isTextFieldLeftView: true, textFieldLeftViewBgColor: Config.ClearColor, textFieldLeftViewMode: .always)
    
    CustomButton.setBtnFontTitleBgColorTintColorWithImage(btn: vc.btnShowHidePassword, andImgOfButton: kIMG_VISIBILITY_OFF, andIsImage: true, andIsOnlyImageNoTintColor: false, andBtnTintColor: Config.BTN_THEME_COLOR, andBtnTitle: "", andBtnTitleColor: Config.ClearColor, andBtnFont: Config.FONTBOLD16, andBtnBgColor: Config.ClearColor, andBtnContentMode: .left, andBtnCornerRadius: 0.0, andBtnBorderColor: Config.ClearColor, andBtnBorderWidth: 0.0, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping, lblTextAlignMent: .left)
    
    //Utility.animateColor(of: "Are you not entertained?!\nHere's something entertaining for you!!", lblMovie: vc.lblMovieDescription)
    
  }
  
  
  //MARK:- TextField Begin Editing Method
  /**
   Call this method for textfield begin editing method
   - Parameter textfield : It is a object of UITextField
   - Parameter vc : It is a object of LoginVC
   - Returns: Bool
   */
  func setTextFieldBeginEditing(textfield : UITextField , vc : LoginVC) -> Bool
  {
    textfield.inputView = nil
    textfield.placeholder = ""
    textfield.keyboardType = .default
    return true
  }
  /**
   Call this method for set text field end editing method
   - Parameter textfield : It is a object of UITextField
   - Parameter vc : It is a object of LoginVC
   */
  func setTextFieldEndEditing(textfield : UITextField , vc : LoginVC)
  {
    setTextIntoArray(textField: textfield, vc: vc)
  }
  
  //MARK: - setTextIntoArray Method
  /**
   Call this method for set array
   - Parameter textField : It is a object of UITextField
   - Parameter vc : It is a object of LoginVC
   */
   func setTextIntoArray(textField : UITextField , vc : LoginVC)
  {
    switch textField.tag
    {
    case 0:
      vc.createUser.email = textField.text!
    case 1:
      vc.createUser.password = textField.text!
    default:
      break
    }
  }
  
  //MARK: - setTextIntoArray Method
  /**
   Call this method for set array
   - Parameter textField : It is a object of UITextField
   - Parameter vc : It is a object of LoginVC
   */
   func setEmptyString(textField : UITextField , vc : LoginVC)
  {
    switch textField.tag
    {
    case 0:
      textField.placeholder =  kTEXTFIELD_ENTER_EMAIL
    case 1:
      textField.placeholder = kTEXTFIELD_ENTER_PASSWORD
    default:
      break
    }
  }
  
  
  //MARK: - set Validation for LoginViewController Screen
  /**
   Call this method for login validation
   - Parameter vc : It is a object of LoginVC
   - Returns: Bool
   */
  func checkValidationForLogin(vc : LoginVC) -> Bool {
    var validateForm : Bool = true
    vc.view.endEditing(true)
    let email = LoginView.validation.checkEmptyAndValidEmailValidation(email: vc.createUser.email)
    let password = LoginView.validation.checkEmptyAndValidPasswordValidation(password: vc.createUser.password)
    if email != "" {
      validateForm = false
      Utility.alertShow(kALERT, message: email , delegate: vc as AnyObject)
    } else if (password != "") {
      validateForm = false
      Utility.alertShow(kALERT, message: password , delegate: vc as AnyObject)
    }
    return validateForm
  }

  //MARK: - Navigate To ForgotPassword Screen
  /**
   Call this method for navigate to forgotPassword
   - Parameter vc : It is a object of LoginVC
   - Returns: Bool
   */
  func navigateToForgotPassword(vc : LoginVC) {
    let objRegistrationOrderNumber = Utility.getStoryboard()?.instantiateViewController(withIdentifier: kVIEWCONTROLLER_IDENTIFIER.forgotPasswordVC) as! ForgotPasswordVC
    vc.navigationController?.pushViewController(objRegistrationOrderNumber, animated: true)
  }

  //MARK: - Navigate To Home Screen
  /**
   Call this method for navigate to Home
   - Parameter vc : It is a object of LoginVC
   - Returns: Bool
   */
  func navigateToHomeVC( vc : LoginVC) {
    DispatchQueue.main.async {
        Utility.navigateToTabBarVC(window: sceneDelegate.window!, isPush: true)
    }
  }
}
