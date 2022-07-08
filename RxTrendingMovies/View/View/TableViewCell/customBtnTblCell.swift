//
//  customBtnTblCell.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 06/07/22.
//

import UIKit

// customBtnTblCell object of UITableViewCell
class customBtnTblCell: UITableViewCell {
  
  /// btnReset object of a CustomButton
  @IBOutlet weak var btnReset: CustomButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    CustomButton.setBtnFontTitleBgColorTintColorWithImage(btn: btnReset, andImgOfButton: "", andIsImage: false, andIsOnlyImageNoTintColor: false, andBtnTintColor: Config.whiteColor, andBtnTitle: "Reset", andBtnTitleColor: Config.whiteColor, andBtnFont: Config.FONTBOLD14, andBtnBgColor: Config.BTN_THEME_COLOR, andBtnContentMode: .center, andBtnCornerRadius: 5.0, andBtnBorderColor: Config.ClearColor, andBtnBorderWidth: 0.0, lblNumberOfLine: 0 , lblLineBreakMode: .byWordWrapping , lblTextAlignMent: .center)
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  //MARK: - setupBtnResetData Method
  /**
   Call this method for set up button cell
   - Parameter vc : It is a object of ForgotPasswordVC
   */
  func setupBtnResetData(vc : ForgotPasswordVC)
  {
    btnReset.addTarget(vc, action:#selector(vc.btnActionResetPassword), for: UIControl.Event.touchUpInside)
  }
  
}
