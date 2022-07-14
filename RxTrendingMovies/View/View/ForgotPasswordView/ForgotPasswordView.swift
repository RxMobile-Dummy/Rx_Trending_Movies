//
//  ForgotPasswordView.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 06/07/22.
//

import UIKit

//
//  LoginVCModel.swift
//  ProjectDemo
//
//  Created by Devangi Prajapati on 7/10/18.
//  Copyright © 2018 Radixweb. All rights reserved.
//

import UIKit
import SwiftyJSON

/// Model class of ForgotPasswordView where business logic written.
class ForgotPasswordView: NSObject
{
  //MARK: - intiallyLoadView Method
  /**
   Call this method for set intially load view functions.
   - Parameter vc : It is a object of ForgotPasswordVC
   */
  class func intiallyLoadView(vc: ForgotPasswordVC)
  {
    /// set ForgotPassword Title for ForgotPasswordVC Screen
    setForgotPasswordVCTitle(vc: vc)
    /// set TextFieldPlaceHolder for ForgotPasswordVC Screen
    setTextFieldPlaceHoder(vc: vc)
    /// set Navigation Button for ForgotPasswordVC Screen
    setNavigationButton(vc: vc)
  }

  //MARK:- set ForgotPasswordVCTitle Method
  /**
   Call this method for set forgotPasswordVC title
   - Parameter vc : It is a object of ForgotPasswordVC
   */
  class func setForgotPasswordVCTitle(vc: ForgotPasswordVC)
  {
    vc.title = kFORGOT_PASSWORD
    vc.navigationController?.isNavigationBarHidden = false
    vc.navigationItem.hidesBackButton = true
    vc.tblForgotPassword.backgroundColor = Config.ClearColor
  }

  //MARK:- SetNavigation Back Button Method
  /**
   Call this method for set navigation back button action
   - Parameter vc : It is a object of ForgotPasswordVC
   */
  class func setNavigationButton(vc : ForgotPasswordVC)
  {
    let button = vc.setCustomNavigationBack(isLeft: true, text: "")
    button.addTarget(vc, action:#selector(vc.backAction), for: UIControl.Event.touchUpInside)
  }

  //MARK:- set TextFieldPlaceHolder Method
  /**
   Call this method for set textfield placeholder.
   - Parameter vc : It is a object of ForgotPasswordVC
   */
  class func setTextFieldPlaceHoder(vc: ForgotPasswordVC){
    vc.arrPlaceHolder =  ["", "Enter eamil" , "Reset Password"]
  }

  //MARK:- Custom Tableview Cell For Row
  class func tableviewCellForRow(indexpath : IndexPath , tblview : UITableView , vc : ForgotPasswordVC) -> UITableViewCell
  {
    var cell = UITableViewCell()
    switch indexpath.row {
    case 0:
      let lblCell = tblview.dequeueReusableCell(withIdentifier: "customLblTblCellIdentifier", for: indexpath) as! customLblTblCell
      lblCell.setUpLblMethod(index: indexpath.row, vc: vc)
      cell =  lblCell
    case 1:
      let txtFieldCell = tblview.dequeueReusableCell(withIdentifier: "customTxtFieldTblCellIdentifier", for: indexpath) as! customTxtFieldTblCell
      txtFieldCell.setUpTextFieldData(index: indexpath.row, vc: vc)
      cell = txtFieldCell
    case 2:
      let btnCell = tblview.dequeueReusableCell(withIdentifier: "customBtnTblCellIdentifier", for: indexpath) as! customBtnTblCell
      btnCell.setupBtnResetData(vc: vc)
      cell = btnCell
    default:
      break
    }
    return cell
  }

  //MARK:- TextField Begin Editing Method
  /**
   Call this method for textfield begin editing method
   - Parameter textfield : It is a object of UITextField
   - Parameter vc : It is a object of ForgotPasswordVC
   - Returns: Bool
   */
  class func setUpTextFieldBeginEditing(textfield : UITextField , vc : ForgotPasswordVC) -> Bool
  {
    switch textfield.tag
    {
    case 1:
      textfield.keyboardType = .default
    default:
      break
    }
    return true
  }

  //MARK:- TextField End Editing Method
  /**
   Call this method for textfield end editing method
   - Parameter textfield : It is a object of UITextField
   - Parameter vc : It is a object of LoginVC
   */
  class func setUpTextFieldEndEditing(textfield : UITextField , vc : ForgotPasswordVC)
  {
    switch textfield.tag
    {
    case 1:
      vc.createUser.email = textfield.text!
      break
    default:
      break
    }
  }

  //MARK: - set Validation for ForgotPasswordVC Screen
  /**
   Call this method for forgotPassword validation
   - Parameter vc : It is a object of ForgotPasswordVC
   - Returns: Bool
   */
  class func checkValidationForForgotPassword(vc : ForgotPasswordVC) -> Bool {
    var validateForm : Bool = true
    vc.view.endEditing(true)
    if vc.createUser.email == ""{
      validateForm = false
      Utility.alertShow(kALERT, message: kMSG_PLEASE_ENTER_EMAIL , delegate: vc as AnyObject)
    } else if !Utility.isValidEmail(vc.createUser.email ?? ""  ) {
      validateForm = false
      Utility.alertShow(kALERT, message: kMSG_PLEASE_ENTER_VALID_EMAIL , delegate: vc as AnyObject)
    }
    return validateForm
  }
}

