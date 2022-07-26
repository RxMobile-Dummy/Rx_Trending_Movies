//
//  LoginVC.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 30/06/22.
//

import UIKit
import TransitionButton

class LoginVC: UIViewController , UITextFieldDelegate {

  //MARK: - ViewController Outlets
  /// emailTextField object of UITextField
  @IBOutlet weak var emailTextField: UITextField!
  /// passWordTextField object of UITextField
  @IBOutlet weak var passWordTextField: UITextField!
  /// btnLogin object of TransitionButton
  @IBOutlet weak var btnLogin: TransitionButton!
  /// btnForgotPassword object of CustomButton
  @IBOutlet weak var btnForgotPassword: CustomButton!
  /// btnSignUp object of CustomButton
  @IBOutlet weak var btnSignUp: CustomButton!
  /// btnShowHidePassword object of CustomButton
  @IBOutlet weak var btnShowHidePassword: CustomButton!
  /// lblMovieDescription object of CustomLabel
  @IBOutlet weak var lblMovieDescription: CustomLabel!

  //MARK: - ViewController Objects
  /// createUser object of CreateUserModel
  var createUser = CreateUserModel()
  /// objLoginView object of LoginView
  var objLoginView = LoginView()

  
  //MARK: - Life cycle of ViewController
  /**
   Called after the controller's view is loaded into memory.
   */
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    objLoginView.intiallyLoadView(vc: self)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    /// Hide Navigation Bar
    self.navigationController?.isNavigationBarHidden = true
  }

  //MARK: -  TextField Delegate method
  /**
   editing began in the specified text field.
   */
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

    let isTextFiled = objLoginView.setTextFieldBeginEditing(textfield: textField, vc: self)
    return isTextFiled
  }
  /**
   textField end editing method
   */
  func textFieldDidEndEditing(_ textField: UITextField)
  {
    objLoginView.setTextFieldEndEditing(textfield: textField, vc: self)
  }
  /**
   textfiledshould return method
   */
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  /**
   textfield sholud change characters method
   */
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
  {
    textField.addTarget(self, action: #selector(didChangeText(textField:)), for: .editingChanged)
    return true
  }

  /**
   textField set text Method
   */
  @objc func didChangeText(textField:UITextField)
  {
    if(textField.text == "") {
      objLoginView.setEmptyString(textField: textField, vc: self)
    } else {
      objLoginView.setTextIntoArray(textField: textField, vc: self)
    }
  }

  //MARK: - Button Action Method
  /**
   Login Button Action
   */
  @IBAction func btnActionLogin(_ button: TransitionButton) {
    if(objLoginView.checkValidationForLogin(vc: self)) {
      button.startAnimation()
      LoginViewModel.signIn(createUser: CreateUserModel(email: createUser.email ?? "", password: createUser.password ?? "")) { success, user, error  in
        if(success == true) {
          button.stopAnimation(animationStyle: .expand, completion: {
            let uid = user?.uid
            kUSERDEFAULT.setValue(uid, forKey: kCurrentUser)
            self.objLoginView.navigateToHomeVC(vc: self)
          })
        } else {
          Utility.alertShow(kALERT, message: error?.localizedDescription ?? "" , delegate: self as AnyObject)
        }
      }
    }
  }
 
  /**
   SignUp Button Action
   */
  @IBAction func btnActionSignUp(_ sender: Any) {
    let objSingUpVC = Utility.getStoryboard()?.instantiateViewController(withIdentifier: kVIEWCONTROLLER_IDENTIFIER.signUpVC) as! SignUpVC
    self.navigationController?.pushViewController(objSingUpVC, animated: true)
  }

  /**
   ForgotPassword Button Action
   */
  @IBAction func btnActionForgotPassword(_ sender: Any) {
    objLoginView.navigateToForgotPassword(vc : self)
  }

  /**
   Show / Hide Password Button Action
   */
  @IBAction func btnActionShowHidePassword(_ sender: Any) {
    if passWordTextField?.isSecureTextEntry ==  true {
      passWordTextField?.isSecureTextEntry = false
      CustomButton.setBtnFontTitleBgColorTintColorWithImage(btn: btnShowHidePassword, andImgOfButton: kIMG_VISIBILITY, andIsImage: true, andIsOnlyImageNoTintColor: false, andBtnTintColor: Config.BTN_THEME_COLOR, andBtnTitle: "", andBtnTitleColor: Config.ClearColor, andBtnFont: Config.FONTBOLD16, andBtnBgColor: Config.ClearColor, andBtnContentMode: .left, andBtnCornerRadius: 0.0, andBtnBorderColor: Config.ClearColor, andBtnBorderWidth: 0.0, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping, lblTextAlignMent: .left)
    }else {
      passWordTextField?.isSecureTextEntry = true
      CustomButton.setBtnFontTitleBgColorTintColorWithImage(btn: btnShowHidePassword, andImgOfButton: kIMG_VISIBILITY_OFF, andIsImage: true, andIsOnlyImageNoTintColor: false, andBtnTintColor: Config.BTN_THEME_COLOR, andBtnTitle: "", andBtnTitleColor: Config.ClearColor, andBtnFont: Config.FONTBOLD16, andBtnBgColor: Config.ClearColor, andBtnContentMode: .left, andBtnCornerRadius: 0.0, andBtnBorderColor: Config.ClearColor, andBtnBorderWidth: 0.0, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping, lblTextAlignMent: .left)
    }
  }

}
