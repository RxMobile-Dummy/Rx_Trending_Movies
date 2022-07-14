//
//  CustomLabel.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 30/06/22.
//

import UIKit

class CustomLabel: UILabel {
    
    //MARK:- Custom Label Method
    /**
     - Parameter lbl : It is a object of UILabel
     - Parameter lblText : It is a object of String
     - Parameter lblFont : It is a object of UIFont
     - Parameter lblTextColor : It is a object of UIColor
     - Parameter lblBgColor : It is a object of UIColor
     - Parameter lblBorderColor : It is a object of UIColor
     - Parameter lblBorderWidth : It is a object of CGFloat
     - Parameter lblCornerRadius : It is a object of CGFloat
     - Parameter lblAttributedText : It is a object of NSAttributedString
     - Parameter isAttributedText : It is a object of Bool
     - Parameter lblTextAlignment : It is a object of NSTextAlignment
     - Parameter lblNumberOfLine : It is a object of Int
     - Parameter lblLineBreakMode : It is a object of NSLineBreakMode
     */
    class func setCustomLblFuncation(lbl : UILabel , lblText : String , lblFont : UIFont? , lblTextColor : UIColor , lblBgColor : UIColor , lblBorderColor : UIColor , lblBorderWidth : CGFloat , lblCornerRadius : CGFloat , lblAttributedText: NSAttributedString!,isAttributedText : Bool,lblTextAlignment : NSTextAlignment , lblNumberOfLine : Int , lblLineBreakMode : NSLineBreakMode)
    {
        switch isAttributedText {
        case true:
            lbl.attributedText = lblAttributedText
        default:
            lbl.text = lblText
            lbl.textColor = lblTextColor
            lbl.font = lblFont
        }
        lbl.backgroundColor = lblBgColor
        lbl.layer.borderColor = lblBorderColor.cgColor
        lbl.layer.borderWidth = lblBorderWidth
        lbl.layer.cornerRadius = lblCornerRadius
        lbl.textAlignment = lblTextAlignment
        lbl.lineBreakMode = lblLineBreakMode
        lbl.numberOfLines = lblNumberOfLine
    }
}
