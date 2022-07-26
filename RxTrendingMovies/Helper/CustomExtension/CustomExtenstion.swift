//
//  CustomExtenstion.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 04/07/22.
//

import Foundation
import UIKit

//MARK: - UIButton Extension
extension UIButton
{
    func setLeftButton(_ navButton:UIButton, _ frame : CGRect , _ titleLabel : String , _ image : String , _ isImage : Bool)
    {
        navButton.frame = frame
        if isImage == true
        {
            let image1 = UIImage(named:
                                    image)?.withRenderingMode(.alwaysTemplate)
            
            navButton.setImage(image1, for: .normal)
            navButton.tintColor = Config.BlackColor
        }
        else
        {
            navButton.setTitle(titleLabel, for: .normal)
            navButton.setTitleColor(Config.BlackColor, for: .normal)
            navButton.titleLabel?.textAlignment = .center
            navButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        }
        navButton.contentMode = .scaleAspectFit
    }
    
    
    func setBtnCornerRadiusBorderColorBgcolor(_ navButton:UIButton, _ borderRadius : CGFloat , _ borderColor  : UIColor , bgColor : UIColor , cornerradius : CGFloat)
    {
        navButton.backgroundColor = bgColor
        navButton.layer.borderWidth = borderRadius
        navButton.layer.borderColor = borderColor.cgColor
        navButton.layer.cornerRadius = cornerradius
    }
    
    func setBtnTextFontTextColor(_ btn : UIButton , title : String , font : UIFont , textColor : UIColor)
    {
        DispatchQueue.main.async{
            btn.setTitle(title, for: .normal)
            btn.titleLabel?.font = font
            btn.setTitleColor(textColor, for: .normal)
            btn.titleLabel?.layer.opacity = 1.0
        }
    }
    
    func setButtonImgTintColor(btn : UIButton , colorForImg : UIColor,strImg : String , _ isImage : Bool)
    {
        if isImage == true
        {
            btn.alpha = 1.0;
            btn.tintColor = colorForImg;
            btn.setImage((UIImage(named: strImg)?.withRenderingMode(.alwaysTemplate))!, for: .normal)
        }
        else
        {
            btn.alpha = 1.0;
            btn.tintColor = colorForImg;
        }
        
    }
    
    func setBtnCornerRadiusWithShadow()
    {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height / 2.0
        self.layer.shadowColor = UIColor.darkGray.cgColor
        //        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.frame.width / 2.0).cgPath
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 2.0
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = true
        self.clipsToBounds = false
    }
}

//MARK: - UIViewController Extension
extension UIViewController {
    
    ///method for navigation bar back button
    func setCustomNavigationBack(isLeft : Bool , text : String , image : String? = "") -> UIButton
    {
        let button = UIButton.init(type: .custom)
        
        if isLeft == true
        {
            button.setLeftButton(button, CGRect(x: 0, y: 0, width: 30, height: 30), "", kIMG_BACK_ARROW , true)
            let barButtonLeft = UIBarButtonItem.init(customView: button)
            self.navigationItem.setLeftBarButton(barButtonLeft, animated: true)
        }
        else
        {
            if(image != "") {
                button.setLeftButton(button, CGRect(x: 0, y: 0, width: 30, height: 30), "", image ?? "" , true)
                let barButtonRight = UIBarButtonItem.init(customView: button)
                self.navigationItem.setRightBarButton(barButtonRight, animated: true)
            }else {
                button.setLeftButton(button, CGRect(x: 0, y: 0, width: 80, height: 30), text, "" , false)
                let barButtonRight = UIBarButtonItem.init(customView: button)
                self.navigationItem.setRightBarButton(barButtonRight, animated: true)
            }
            
        }
        return button
    }
    
    func showToast(message : String) {

        var hgt = message.heightForView(font: UIFont.systemFont(ofSize: 16.0), width: self.view.frame.size.width - 40)
        hgt = hgt > 50 ? hgt : 50
        let toastLabel = UILabel(frame: CGRect(x: 20, y: self.view.frame.size.height - (hgt + 150), width: self.view.frame.size.width - 40, height: hgt))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont.systemFont(ofSize: 16.0)
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

//MARK: - UIColor Extension
extension UIColor {

    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

//MARK: - String Extension
extension String {
    func heightForView(font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = self

        label.sizeToFit()
        return label.frame.height
    }
}

//MARK: - UIImageView Extension
extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}

//MARK: - UIApplication Extension
extension UIApplication
{
  //setUp StatusBar Backgroundcolor
  var statusBarUIView: UIView? {
    if #available(iOS 13.0, *) {
      let tag = 101
      if let statusBar = sceneDelegate.window?.viewWithTag(tag) {
        return statusBar
      } else {
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        statusBarView.tag = tag
        statusBarView.backgroundColor = Config.BTN_THEME_COLOR
        sceneDelegate.window?.addSubview(statusBarView)
        return statusBarView
      }
    } else {
      if responds(to: Selector(("statusBar"))) {
        return value(forKey: "statusBar") as? UIView
      }
    }
    return nil
  }
}
