//
//  CustomAlert.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 05/07/22.
//

import UIKit

//
//  PICSYAlertView.swift
//  Picsy
//
//  Created by Jaimin Galiya on 05/10/17.
//  Copyright © 2017 Mohini Bhavsar. All rights reserved.
//

import UIKit
import Combine

//Property of Enum to check the Action type
enum ActionType{
    case Yes, No
}

struct ApplyAll{
    var color: Bool
    var frame: Bool
    var filter: Bool
}

class CustomAlert: UIViewController, UITextFieldDelegate {


  //Property of UILabel to display Alert Title.
  @IBOutlet weak var lblAlertTitle: UILabel!
  //Property of UILabel to display Alert Message.
  @IBOutlet weak var lblAlertMessage: UILabel!
  //Property of No Button.
  @IBOutlet weak var btnNo: CustomButton!
  //Property of Yes Button.
  @IBOutlet weak var btnYes: CustomButton!
  //Property of UIView for bottom button setup.
  @IBOutlet weak var viewBottomButtonView: UIView!
  //Property of UIView with image alert.
  @IBOutlet weak var viewImageAlert: CustomShadowView!
  //Property of UIView for container of yes button.
  @IBOutlet weak var viewYes: UIView!
  //Property of UIView for container of no button.
  @IBOutlet weak var viewNo: UIView!
  //Property of NSLayoutConstraint for trailing con of yes button.
  @IBOutlet var conYesBtnTrailing: NSLayoutConstraint!
  @IBOutlet var conlblTitleHeight: NSLayoutConstraint!
  @IBOutlet weak var conYesBtnLeading: NSLayoutConstraint!
  //Property of UIView Which contains label.
  @IBOutlet var viewLblMessage: UIView!
  //Property of UIView Which contains textfield.
  @IBOutlet var viewTextField: UIView!
  //Property of UITextField To take text input in alert view.
  @IBOutlet var txtAlertTextField: CustomTextField!

  //Action of yes button.
  var yesBtnAction: (()->Void)!
  //Action of apply all yes button.
  var applyForgotPWDyesBtnAction: ((_ strTextField: String) -> Void)!
  //Action of No button.
  var noBtnAction: (()->Void)!
  //Property of String for alert title
  var strOfAlertTitle: String!
  //Property of String for alert message
  var strOfAlertMessage: String!
  //Property of String for alert message
  var strOfPlaceHolder: String!
  //Property of UIImage for alert image.
  var imgAlert: String?
  //Property of String for yes button title.
  var strOfYesButtonTitle: String?
  //Property of String for no button title.
  var strOfNoButtonTitle: String?

  var isDisplayTitle: Bool = false
  //Property of Boolean to determine that display textfield in alertview.
  var isContainsTextField: Bool = false

  var isForgotPWD : Bool = false

  var strEmail : String = ""

  //  @Published var canSendEmailString = PassthroughSubject<String , Never>()
  //  let canSendEmailString = PassthroughSubject<String, Never>()



  private var forgotPasswordSubscriber : AnyCancellable? = nil

  override func viewDidLoad() {
    super.viewDidLoad()
    viewImageAlert.isHidden = false
    initialSetup()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

  }

  func initialSetup(){
    self.view.backgroundColor = Config.BlackColor.withAlphaComponent(0.6)
    if isDisplayTitle {
      lblAlertTitle.text = strOfAlertTitle
      lblAlertTitle.font = Config.FONTBOLD16
      lblAlertTitle.textColor = Config.BlackColor
    }else {
      conlblTitleHeight.constant = 0.0
    }
    lblAlertMessage.text = strOfAlertMessage
    lblAlertMessage.textColor = Config.LightGrayColor
    lblAlertMessage.font = Config.FONTREGULAR12

    CustomButton.setBtnFontTitleBgColorTintColorWithImage(btn: btnYes, andImgOfButton: "", andIsImage: false, andIsOnlyImageNoTintColor: false, andBtnTintColor: Config.whiteColor, andBtnTitle: "Yes", andBtnTitleColor: Config.whiteColor, andBtnFont: Config.FONTBOLD16, andBtnBgColor: Config.BTN_THEME_COLOR, andBtnContentMode: .center, andBtnCornerRadius: 10.0, andBtnBorderColor: Config.ClearColor, andBtnBorderWidth: 0.0, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping, lblTextAlignMent: .center)

    CustomButton.setBtnFontTitleBgColorTintColorWithImage(btn: btnNo, andImgOfButton: "", andIsImage: false, andIsOnlyImageNoTintColor: false, andBtnTintColor: Config.whiteColor, andBtnTitle: "No", andBtnTitleColor: Config.whiteColor, andBtnFont: Config.FONTBOLD16, andBtnBgColor: Config.BTN_THEME_COLOR, andBtnContentMode: .center, andBtnCornerRadius: 10.0, andBtnBorderColor: Config.ClearColor, andBtnBorderWidth: 0.0, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping, lblTextAlignMent: .center)

    _ =  CustomTextField.textRect(txtAlertTextField)


    //Show/hide textfield.
    if isContainsTextField{
      txtAlertTextField.isHidden = false
      viewTextField.isHidden = false
      txtAlertTextField.placeholder = strOfPlaceHolder
      viewLblMessage.isHidden = false
      lblAlertMessage.isHidden = false
    }else{
      viewTextField.isHidden = true
      txtAlertTextField.isHidden = true
      viewLblMessage.isHidden = false
      lblAlertMessage.isHidden = false
    }
  }


  //MARK: TextField Delegate method
  /**
   editing began in the specified text field.
   */
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    return true
  }
  /**
   textField end editing method
   */
  func textFieldDidEndEditing(_ textField: UITextField)
  {
    strEmail = textField.text ?? ""
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
      textField.placeholder = strOfAlertMessage
    } else {
      strEmail = textField.text ?? ""
    }
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    txtAlertTextField.resignFirstResponder()
    return true
  }


  class func displayAlertWithTextField(onView delegate: AnyObject, withTitle title: String , withAlertMsg alertMessage : String? , isForgotPassword password : Bool? = false, placeHolderMessage message: String, alertImage image: String?, yesButtonTitle yesTitle: String?, yesButtonAction yesAction: @escaping (_ strTextField: String)->Void, noButtonTitle noTitle: String?, noButtonAction noAction: @escaping ()->Void)  {
    let alertController = Utility.setStoryboard()?.instantiateViewController(withIdentifier: "CustomAlertIdentifier") as! CustomAlert
    alertController.strOfAlertTitle = title
    alertController.strOfPlaceHolder = message
    alertController.strOfAlertMessage = alertMessage
    alertController.isDisplayTitle = true
    alertController.imgAlert = image
    alertController.strOfYesButtonTitle = yesTitle
    alertController.strOfNoButtonTitle = noTitle
    alertController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    alertController.modalTransitionStyle = .crossDissolve
    alertController.applyForgotPasswordYesButtonAction(yesAction)
    alertController.noButtonAction(noAction)
    alertController.isForgotPWD = password ?? false
    alertController.isContainsTextField = true
    delegate.present(alertController, animated: true, completion: nil)
  }

  func yesButtonAction(_ yAction: @escaping ()->Void){
    self.yesBtnAction = yAction
  }

  func applyForgotPasswordYesButtonAction(_ yAction: @escaping (_ strTextField: String)->Void){
    self.applyForgotPWDyesBtnAction = yAction
  }

  func noButtonAction(_ nAction: @escaping ()->Void){
    self.noBtnAction = nAction
  }

  @IBAction func btnYesTapAction(_ sender: AnyObject) {
    print(txtAlertTextField.text!)
    //    self.objOfLogin.canSendEmailString.send(txtAlertTextField.text!)
    closeView(true, source: .Yes)
  }

  @IBAction func btnNoTapAction(_ sender: AnyObject) {
    closeView(true, source: .No)
  }


  /// Removes view
  ///
  /// - Parameters:
  ///   - withCallback: callback availabel
  internal func closeView(_ withCallback: Bool, source: ActionType = .No) {
    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
      //self.containerView.center.y = self.view.center.y + self.viewHeight!
    }, completion: { finished in
      UIView.animate(withDuration: 0.1, animations: {
        self.view.alpha = 0
      }, completion: { finished in
        self.dismiss(animated: false, completion: {
          if withCallback {
            if let action = self.yesBtnAction, source == .Yes {
              action()
            } else if let action  = self.applyForgotPWDyesBtnAction , source == .Yes {
              action(self.txtAlertTextField.text ?? "")
            }
            else if let action = self.noBtnAction, source == .No{
              action()
            }
          }
        })
      })
    })
  }
}
