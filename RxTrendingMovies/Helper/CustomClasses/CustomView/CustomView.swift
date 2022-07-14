//
//  CustomView.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 30/06/22.
//

import UIKit

class CustomView: UIView {
  class func setCustomViewBgColorCornerRadius(view : UIView , viewBgColor : UIColor , viewCornerRadius : CGFloat , isCornerRadius : Bool) {
    view.backgroundColor = viewBgColor
    if (isCornerRadius) {
      view.layer.cornerRadius = viewCornerRadius
    }
  }
}

class CustomShadowView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 4.0
    var shadowColor: UIColor = UIColor.gray

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.setDropShadowAndRadius()
    }

    func setDropShadowAndRadius() {
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.shadowRadius = 2.0
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.7)
        self.layer.shadowOpacity = 0.5
        self.layer.cornerRadius = cornerRadius
    }

}
