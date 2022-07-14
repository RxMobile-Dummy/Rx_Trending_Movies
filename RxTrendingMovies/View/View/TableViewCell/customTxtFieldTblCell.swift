//
//  customTxtFieldTblCell.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 06/07/22.
//

import UIKit

/// customTxtFieldTblCell Class Of UITableViewCell
class customTxtFieldTblCell: UITableViewCell {

  /// txtField object of CustomTextField
  @IBOutlet weak var txtField: CustomTextField!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    _ = CustomTextField.textRect(txtField!)
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }

  //MARK: - setUpTextFieldData For ForgotPassword
  /**
   Call this method for text cell
   - Parameter index : It is a object of Int
   - Parameter vc : It is a object of ForgotPasswordVC
   */
  func setUpTextFieldData(index : Int , vc : ForgotPasswordVC)
  {
    txtField.tag = index
    var strText : String = ""
    var strPlaceHolder : String = ""
    switch index
    {
    case 1:
      if ((vc.createUser.email?.isEmpty) != nil)
      {
        strText = ""
        strPlaceHolder = vc.arrPlaceHolder[index]
      }
      else{
        strText = vc.createUser.email ?? ""
        strPlaceHolder = ""
      }
    default:
      break
    }
    CustomTextField.setCustomTextfield(textField: txtField, textFieldFont: Config.FONTREGULAR12, textFieldText: strText , textFieldTextColor: Config.BlackColor, textFieldTextAligenment: .left, textFieldPlaceHolder: strPlaceHolder , textFieldTintColor: Config.BlackColor, isTextFieldBorder: false, textFieldBorderColor: Config.ClearColor, textFieldBorderWidth: 0.0, isTextFieldLeftView: true, textFieldLeftViewBgColor: Config.ClearColor, textFieldLeftViewMode: .always)
  }

}
