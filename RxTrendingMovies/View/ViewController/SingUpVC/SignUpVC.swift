//
//  SignUpVC.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 01/07/22.
//

import UIKit
import TransitionButton

class SignUpVC: UIViewController , UITextFieldDelegate {

  //MARK: - ViewController Outlets
  /// txtFName object of UITextField
  @IBOutlet weak var txtFName: UITextField!
  /// txtLName object of UITextField
  @IBOutlet weak var txtLName: UITextField!
  /// txtEmail object of UITextField
  @IBOutlet weak var txtEmail: UITextField!
  /// txtMobileNumber object of UITextField
  @IBOutlet weak var txtMobileNumber: UITextField!
  /// txtPassword object of UITextField
  @IBOutlet weak var txtPassword: UITextField!
  /// txtConfirmPassword object of UITextField
  @IBOutlet weak var txtConfirmPassword: UITextField!
  /// btnContinue object of TransitionButton
  @IBOutlet weak var btnContinue: TransitionButton!

  //MARK: - ViewController Objects
  /// createUser object of CreateUserModel
  var createUser = CreateUserModel()
  /// objOfSignUpView object of SignUpView
  var objOfSignUpView = SignUpView()


  //MARK: - Life cycle of ViewController
  /**
   Called after the controller's view is loaded into memory.
   */
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    objOfSignUpView.intiallyLoadView(vc: self)
  }


  //MARK: -  TextField Delegate method
  /**
   editing began in the specified text field.
   */
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

    let isTextFiled = objOfSignUpView.setTextFieldBeginEditing(textfield: textField, vc: self)
    return isTextFiled
  }
  /**
   textField end editing method
   */
  func textFieldDidEndEditing(_ textField: UITextField)
  {
    objOfSignUpView.setTextFieldEndEditing(textfield: textField, vc: self)
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
      objOfSignUpView.setEmptyString(textField: textField, vc: self)
    } else {
      objOfSignUpView.setTextIntoArray(textField: textField, vc: self)
    }
  }

  //MARK: - Button Action Method
  /**
   Continue Button Action
   */
  @IBAction func btnActionContinue(_ button: TransitionButton) {
    if(objOfSignUpView.checkValidationForLogin(vc: self)) {
      button.startAnimation()
      SignUpViewModel.createUserSignUp(createUser: CreateUserModel(firstname: createUser.firstname
                                                                   , lastname: createUser.lastname, email: createUser.email, mobilenumber: createUser.mobilenumber, password: createUser.password, confirmpassword: createUser.confirmpassword)) { success, error  in
        if(success == true) {
          LoginViewModel.signIn(createUser: CreateUserModel(email: self.createUser.email ?? "", password: self.createUser.password ?? "")) { success, user, error  in
            if(success == true) {
              button.stopAnimation(animationStyle: .expand, completion: {
                let uid = user?.uid
                kUSERDEFAULT.setValue(uid, forKey: kCurrentUser)
                self.objOfSignUpView.navigateToHomeVC(vc: self)
              })
            } else {
              Utility.alertShow(kALERT, message: error?.localizedDescription ?? "" , delegate: self as AnyObject)
            }
          }
        } else {
          Utility.alertShow(kALERT, message: error?.localizedDescription ?? "" , delegate: self as AnyObject)
        }
      }
    }
  }
  /**
   method for navigation bar back button action
   */
  @objc func backAction()
  {
    self.navigationController?.popViewController(animated: true)
  }
    
}
