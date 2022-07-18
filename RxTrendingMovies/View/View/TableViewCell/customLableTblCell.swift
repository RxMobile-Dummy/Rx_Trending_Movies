//
//  lableTblCell.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 06/07/22.
//

import UIKit

/// customLblTblCell object of a UITableViewCell
class customLblTblCell: UITableViewCell {
  
  /// lblTitle object of CustomLabel
  @IBOutlet weak var lblTitle: CustomLabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  //MARK: - SetUp Custom Label Method
  /**
   Call this method for set up label cell
   - Parameter index : It is a object of Int
   - Parameter vc : It is a object of ForgotPassword Screen
   */
  func setUpLblMethod(index : Int , vc : ForgotPasswordVC) {
    CustomLabel.setCustomLblFuncation(lbl: lblTitle, lblText: kMSG_PLEASE_ENTER_YOUR_REGISTER_EMAIL_ADDRESS, lblFont: Config.FONTREGULAR14, lblTextColor: Config.BlackColor, lblBgColor: Config.ClearColor, lblBorderColor: Config.ClearColor, lblBorderWidth: 0.0, lblCornerRadius: 0.0, lblAttributedText: nil, isAttributedText: false, lblTextAlignment: .center, lblNumberOfLine: 0, lblLineBreakMode: .byCharWrapping)
  }
}
