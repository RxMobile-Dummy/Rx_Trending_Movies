//
//  LoginVC.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 30/06/22.
//

import UIKit
import Combine

class LoginVC: UIViewController , UITextFieldDelegate {

  //MARK: - ViewController Outlets
  /// emailTextField object of UITextField
  @IBOutlet weak var emailTextField: UITextField!
  /// passWordTextField object of UITextField
  @IBOutlet weak var passWordTextField: UITextField!
  /// btnLogin object of CustomButton
  @IBOutlet weak var btnLogin: CustomButton!
  /// btnForgotPassword object of CustomButton
  @IBOutlet weak var btnForgotPassword: CustomButton!
  /// btnSignUp object of CustomButton
  @IBOutlet weak var btnSignUp: CustomButton!
  /// btnShowHidePassword object of CustomButton
  @IBOutlet weak var btnShowHidePassword: CustomButton!

  //MARK: - ViewController Objects
  /// createUser object of CreateUserModel
  var createUser = CreateUserModel()
  /// objLoginView object of LoginView
  var objLoginView = LoginView()

  var strForgotPassword : String = ""
  var strEmail = ""
  var cancellable: AnyCancellable?
  let canSendEmailString = PassthroughSubject<String, Never>()

  
  //MARK: - Life cycle of ViewController
  /**
   Called after the controller's view is loaded into memory.
   */
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    objLoginView.intiallyLoadView(vc: self)
      
      print(Environment.apiKey)
      print(Environment.rootURL)
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
  @IBAction func btnActionLogin(_ sender: Any) {
    if(objLoginView.checkValidationForLogin(vc: self)) {
         LoginViewModel.signIn(createUser: CreateUserModel(email: createUser.email ?? "", password: createUser.password ?? "")) { success, user, error  in
         if(success == true) {
             let uid = user?.uid
                 kUSERDEFAULT.setValue(uid, forKey: "CurrentUser")
                 self.objLoginView.navigateToHomeVC(vc: self)
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
      
    ////    let publisher = self.canSendEmailString.eraseToAnyPublisher()
    //    let subscriber2 =  self.canSendEmailString.sink(receiveValue: { value in
    //      print("value: ", value)
    //    })
    //    CustomAlert.displayAlertWithTextField(onView: self, withTitle: "Forgot Password" , withAlertMsg: "We send you an email with instructions on how to reset your password.", placeHolderMessage: "Enter Email", alertImage: "", yesButtonTitle: "Yes", yesButtonAction: { strTextField in
    //      self.strForgotPassword = strTextField
    //      //self.canSendEmailString.send("txtAlertTextField.text!")
    //      if(LoginView.checkValidationForForgotPassword(vc: self)) {
    //        LoginViewModel.forgotPassword(createUser: CreateUserModel(email: strTextField)) { success, error in
    //          if(success == true) {
    //
    //          } else {
    //            Utility.alertShow(kALERT, message: error?.localizedDescription ?? "" , delegate: self as AnyObject)
    //          }
    //        }
    //      }
    //    }, noButtonTitle: "No") {
    //      print("No")
    //    }
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
