//
//  CustomTextField.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 30/06/22.
//

import UIKit

class CustomTextField: UITextField {


    //MARK:- set Padding in TextField
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    //MARK:- Set Custom Textfiled Method
    /**
     - Parameter textField : It is a object of UITextField
     - Parameter textFieldFont : It is a object of UIFont
     - Parameter textFieldText : It is a object of String
     - Parameter textFieldTextColor : It is a object UIColor
     - Parameter textFieldTextAligenment : It is a object NSTextAlignment
     - Parameter textFieldPlaceHolder : It is a object String
     - Parameter textFieldTintColor : It is a object UIColor
     - Parameter isTextFieldBorder : It is a object Bool
     - Parameter textFieldBorderColor : It is a object UIColor
     - Parameter textFieldBorderWidth : It is a object CGFloat
     - Parameter isTextFieldLeftView : It is a object Bool
     - Parameter textFieldLeftViewBgColor : It is a object UIColor
     - Parameter textFieldLeftViewMode : It is a object UITextFieldViewMode
     */
    class func setCustomTextfield(textField : UITextField , textFieldFont : UIFont? , textFieldText : String , textFieldTextColor : UIColor , textFieldTextAligenment : NSTextAlignment , textFieldPlaceHolder : String , textFieldTintColor : UIColor , isTextFieldBorder : Bool , textFieldBorderColor : UIColor,textFieldBorderWidth : CGFloat , isTextFieldLeftView : Bool , textFieldLeftViewBgColor : UIColor , textFieldLeftViewMode : UITextField.ViewMode)
  {
    textField.textRect(forBounds: textField.frame)
    textField.text = textFieldText
    textField.placeholder = textFieldPlaceHolder
    textField.font = textFieldFont
    textField.textColor = textFieldTextColor
    textField.textAlignment = textFieldTextAligenment
    textField.tintColor = textFieldTintColor

    if (isTextFieldBorder) {
      textField.layer.borderColor = textFieldBorderColor.cgColor
      textField.layer.borderWidth = 1.0
    }
    if (isTextFieldLeftView) {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: textField.frame.height))
      paddingView.layer.backgroundColor = textFieldLeftViewBgColor.cgColor
      textField.leftView = paddingView
      textField.leftViewMode = textFieldLeftViewMode
    }
  }
}
