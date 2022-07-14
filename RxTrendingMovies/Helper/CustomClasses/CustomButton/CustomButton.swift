//
//  CustomButton.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 30/06/22.
//

import UIKit

class CustomButton: UIButton {
    
    //MARK: Set Button Tint Color Throught Image
    /**
     Call this method for button tint color with image
     - Parameter btnTintColor: It is a UIColor type value.
     - Parameter imgConstant: It is a String type value.
     - Parameter btn: It is a UIButton type value.
     - Parameter btnAlpha: It is a CGFloat type value.
     - Parameter isBtnAlpha: It is a Bool type value.
     */
    class func setButtonTintColor(btn: UIButton? , btnTintColor: UIColor?, andImgOfButton imgConstant: String?, btnAlpha : CGFloat , isBtnAlpha : Bool) {
        let image1 = (UIImage(named: imgConstant ?? ""))?.withRenderingMode(.alwaysTemplate)
        btn?.setImage(image1, for: .normal)
        if let btnTintColor = btnTintColor {
            btn?.tintColor = btnTintColor
        }
        btn?.contentMode = .scaleAspectFit
        if (isBtnAlpha) {
            btn?.alpha = btnAlpha
        }
    }
    
    //MARK:- Set Button Function With Image
    /**
     Call this method for button function with image or without image
     - Parameter btn: It is a UIButton type value.
     - Parameter imgConstant: It is a String type value.
     - Parameter isImage: It is a Bool type value.
     - Parameter isOnlyImage: It is a Bool type value.
     - Parameter btnTintColor: It is a UIColor type value.
     - Parameter btnTitle: It is a String type value.
     - Parameter btnTitleColor: It is a UIColor type value.
     - Parameter btnFont: It is a UIFont type value.
     - Parameter btnBgColor: It is a UIColor type value.
     - Parameter btnContentMode: It is a UIViewContentMode type value.
     - Parameter btnCornerRadius: It is a CGFloat type value.
     - Parameter btnBorderColor: It is a UIColor type value.
     - Parameter btnBorderWidth: It is a CGFloat type value.
     */
    class func setBtnFontTitleBgColorTintColorWithImage(btn: UIButton? , andImgOfButton imgConstant: String? , andIsImage  isImage : Bool? , andIsOnlyImageNoTintColor  isOnlyImage : Bool,  andBtnTintColor btnTintColor: UIColor? , andBtnTitle  btnTitle : String! , andBtnTitleColor btnTitleColor : UIColor , andBtnFont btnFont : UIFont? , andBtnBgColor btnBgColor : UIColor , andBtnContentMode btnContentMode : UIView.ContentMode , andBtnCornerRadius btnCornerRadius : CGFloat , andBtnBorderColor  btnBorderColor: UIColor , andBtnBorderWidth btnBorderWidth : CGFloat , lblNumberOfLine : Int , lblLineBreakMode : NSLineBreakMode , lblTextAlignMent : NSTextAlignment)
    {
        if (isOnlyImage) {
            let image1 = (UIImage(named: imgConstant ?? ""))?.withRenderingMode(.alwaysTemplate)
            btn?.setImage(image1, for: .normal)
        }
        else if (isImage!)
        {
            let image1 = (UIImage(named: imgConstant ?? ""))?.withRenderingMode(.alwaysTemplate)
            btn?.setImage(image1, for: .normal)
            if let btnTintColor = btnTintColor {
                btn?.tintColor = btnTintColor
            }
        }else {
            btn?.tintColor = btnTintColor
        }
        btn?.setTitle(btnTitle, for: .normal)
        btn?.setTitleColor(btnTitleColor, for: .normal)
        btn?.titleLabel?.font = btnFont
        btn?.backgroundColor = btnBgColor
        btn?.contentMode = btnContentMode
        btn?.layer.cornerRadius = btnCornerRadius
        btn?.layer.borderWidth = btnBorderWidth
        btn?.titleLabel?.numberOfLines = lblNumberOfLine
        btn?.titleLabel?.lineBreakMode = lblLineBreakMode
        btn?.titleLabel?.textAlignment = lblTextAlignMent
        btn?.layer.borderColor = btnBorderColor.cgColor
    }
    
    //MARK:- Set Button Text With Image Same Line
    /**
     Call this method for button text with same line
     - Parameter btnFrame: It is a CGRect type value.
     - Parameter btnName: It is a String type value.
     - Parameter btnImage: It is a String type value.
     - Parameter btnTintColor: It is a UIColor type value.
     - Parameter btnTextColor: It is a UIColor type value.
     - Parameter btnTextFont: It is a UIFont type value.
     - Parameter btnSpace: It is a CGFloat type value.
     - Parameter btnAlpha: It is a CGFloat type value.
     - Parameter btnAttributedText: It is a NSAttributedString type value.
     - Parameter isAttributedText: It is a Bool type value.
     - Parameter btnBorderColor: It is a UIColor type value.
     - Parameter btnBorderWidth: It is a CGFloat type value.
     - Parameter btnImageRenderingMode: It is a UIImageRenderingMode type value.
     */
    class func customButtonTextWithImageSameline(btn : UIButton, btnFrame : CGRect,btnName : String,btnImage : String,btnTintColor : UIColor, btnTextColor : UIColor, btnTextFont : UIFont,btnSpace : CGFloat,btnAlpha : CGFloat,btnAttributedText: NSAttributedString?,isAttributedText : Bool, btnBorderColor : UIColor, btnBorderWidth: CGFloat,btnImageRenderingMode : UIImage.RenderingMode)
    {
        btn.frame = CGRect(x: btnFrame.origin.x, y:  btnFrame.origin.y, width: btnFrame.size.width, height:btnFrame.size.height)
        btn.isHighlighted = false
        btn.imageView?.isHidden = true
        btn.setTitle("", for:.normal)
        if btnImage != ""
        {
            btn.imageView?.isHidden = false
            btn.setImage((UIImage(named: btnImage)?.withRenderingMode(btnImageRenderingMode))!, for: .normal)
            btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 )
            btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -(btn.imageView?.frame.size.width)! + btnSpace, bottom: 0, right: 0)
        }
        else
        {
            btn.setImage(nil, for: .normal)
            btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        if isAttributedText
        {
            btn.setImage(nil, for: .normal)
            btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            btn.setAttributedTitle(btnAttributedText, for: .normal)
        }
        else
        {
            btn.setTitle(btnName, for:.normal)
            btn.setTitleColor(btnTextColor, for: UIControl.State.normal)
            btn.titleLabel?.font = btnTextFont
        }
        // self.tintColor = tintColor
        btn.alpha = btnAlpha
        btn.layer.borderWidth = btnBorderWidth
        btn.layer.borderColor = btnBorderColor.cgColor
        btn.layer.masksToBounds = true
        btn.clipsToBounds = false
    }
    
    //MARK:- change single text color and font in Main String
    /**
     change single text color and font in Main String
     - Parameter mainString: String
     - Parameter mainFont: UIFont
     - Parameter mainTextColor: UIColor
     */
    class func setBtnDrawLineAttributeText(btn : UIButton ,mainString : String, mainFont : UIFont, mainTextColor : UIColor)
    {
        let attributedString = NSMutableAttributedString(string: mainString)
        let rangeMain = (mainString as NSString).range(of: mainString)
        attributedString.addAttribute(NSAttributedString.Key.font, value:mainFont, range: rangeMain)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: mainTextColor, range: rangeMain)
        let rangeChange = (mainString as NSString).range(of: mainString)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeChange)
        attributedString.addAttribute(NSAttributedString.Key.font, value:mainFont, range: rangeChange)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: mainTextColor, range: rangeChange)
        btn.setAttributedTitle(attributedString, for: .normal)
    }
    
}
