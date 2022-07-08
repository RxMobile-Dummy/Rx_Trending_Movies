//
//  LoginVC.swift
//  ProjectDemo
//
//  Created by Devangi Prajapati on 7/10/18.
//  Copyright © 2018 Radixweb. All rights reserved.
//

import UIKit

/// ForgotPasswordVC class of UIViewController
class ForgotPasswordVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate
{
  //MARK: - ViewController Outlets
  /// tblForgotPassword object of UITableView
  @IBOutlet weak var tblForgotPassword: UITableView!
  
  //MARK: - ViewController Objects
  /// arrplaceHolder object of String type of Array
  var arrPlaceHolder : [String] = []
  /// createUser object of CreateUserModel
  var createUser = CreateUserModel()
  
  //MARK: - Life cycle of ViewController
  /**
   Called after the controller's view is loaded into memory.
   */
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // Do any additional setup after loading the view.
    ForgotPasswordView.intiallyLoadView(vc: self)
  }
  
  /**
   Sent to the view controller when the app receives a memory warning.
   */
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //MARK: - TableView DataSource Method
  /**
   Call this method for Asks the data source to return the number of sections in the table view.
   */
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  /**
   Call this method for Tells the data source to return the number of rows in a given section of a table view.
   */
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return arrPlaceHolder.count
  }
  /**
   Call this method for Asks the data source for a cell to insert in a particular location of the table view.
   */
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = ForgotPasswordView.tableviewCellForRow(indexpath: indexPath, tblview: tblForgotPassword, vc: self)
    return cell
  }


  //MARK: - TableView Delegate Method
  /**
   Call this method for set custom height for row in tableview.
   */
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
  {
    return UITableView.automaticDimension
  }
  
  
  //MARK :- TextField Delegate method
  /**
   Call this method for editing began in the specified text field.
   */
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
  {
    let isTextFiled = ForgotPasswordView.setUpTextFieldBeginEditing(textfield: textField, vc: self)
    return isTextFiled
  }
  /**
   Call this method for editing stopped for the specified text field.
   */
  func textFieldDidEndEditing(_ textField: UITextField)
  {
    ForgotPasswordView.setUpTextFieldEndEditing(textfield: textField, vc: self)
  }
  /**
   Call this method for text field calls this method whenever user actions cause its text to change.
   */
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
  {
    textField.addTarget(self, action: #selector(didChangeText(textField:)), for: .editingChanged)
    switch textField.tag
    {
    case 1:
      return string.rangeOfCharacter(from: Config.characterSpecialChar, options: [], range: string.startIndex ..< string.endIndex) == nil && !(textField.text!.count + string.count > Config.kTXTLENGTH && (string.count ) > range.length)
    default:
      break
    }
    return true
  }
  /**
   Call this method for textField set text Method.
   */
  @objc func didChangeText(textField:UITextField)
  {
    switch textField.tag
    {
    case 1:
      createUser.email = textField.text!
      break
    default:
      break
    }
  }
  /**
   Call this method for textFieldSholud return method.
   */
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }

  //MARK: - Button Action Method
  /**
   method for navigation bar back button action
   */
  @objc func backAction()
  {
    self.navigationController?.popViewController(animated: true)
  }
  /**
   Reset Button Action
   */
  @objc func btnActionResetPassword()
  {
    if(ForgotPasswordView.checkValidationForForgotPassword(vc: self)) {
      ForgotPasswordModel.forgotPassword(createUser: CreateUserModel(email: createUser.email ?? "")) { success, error in
        if(success == true) {
          self.navigationController?.popViewController(animated: true)
        } else {
          Utility.alertShow(kALERT, message: error?.localizedDescription ?? "" , delegate: self as AnyObject)
        }
      }
    }
  }
}
