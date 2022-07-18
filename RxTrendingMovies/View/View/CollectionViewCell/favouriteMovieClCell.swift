//
//  bookMarkMovieClCell.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 08/07/22.
//

import UIKit
import Kingfisher

class favouriteMovieClCell: UICollectionViewCell {

  /// mainView object of CustomShadowView
  @IBOutlet weak var mainView: CustomShadowView!
  /// movieImageView object of UIImageView
  @IBOutlet weak var movieImageView : UIImageView!
  /// lblMovieName object of CustomLabel
  @IBOutlet weak var lblMovieName: CustomLabel!
  /// btnFavourite object of CustomButton
  @IBOutlet weak var btnFavourite: CustomButton!

  override func layoutSubviews() {
    super.layoutSubviews()
  }

  //MARK: - Set Up Favourite Movie Method
  /**
   - Parameter index : Int
   - Parameter vc : FavouriteVC
   - Parameter movieModel : MovieListModel
   */
  func setUpFavouriteMovieMethod(index : Int , vc : FavouriteVC , movieModel : MovieListModel) {
    let url = URL(string: kGET_IMAGE_PATH + (movieModel.posterPath ?? ""))
    movieImageView.kf.indicatorType = .activity
    movieImageView.contentMode = .scaleToFill
    movieImageView.kf.setImage(with: url!)
    CustomLabel.setCustomLblFuncation(lbl: lblMovieName, lblText: movieModel.title ?? "", lblFont: Config.FONTREGULAR12, lblTextColor: Config.BlackColor, lblBgColor: Config.ClearColor, lblBorderColor: Config.ClearColor, lblBorderWidth: 0.0, lblCornerRadius: 0.0, lblAttributedText: nil, isAttributedText: false, lblTextAlignment: .center, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping)
    btnFavourite.tag = index
    CustomButton.setBtnFontTitleBgColorTintColorWithImage(btn: btnFavourite, andImgOfButton: kIMG_FAVOURITE, andIsImage: true, andIsOnlyImageNoTintColor: false, andBtnTintColor: Config.BTN_THEME_COLOR, andBtnTitle: "", andBtnTitleColor: Config.ClearColor, andBtnFont: Config.FONTREGULAR10, andBtnBgColor: Config.ClearColor, andBtnContentMode: .center, andBtnCornerRadius: 0.0, andBtnBorderColor: Config.ClearColor, andBtnBorderWidth: 0.0, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping, lblTextAlignMent: .center)
    btnFavourite.addTarget(vc, action:#selector(vc.btnActionFavourite), for: UIControl.Event.touchUpInside)
  }
}
