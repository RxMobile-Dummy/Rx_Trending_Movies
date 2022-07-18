//
//  treandingMoviesClCell.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 08/07/22.
//

import UIKit
import Kingfisher

class treandingMoviesClCell: UICollectionViewCell {

  /// mainView object of CustomShadowView
  @IBOutlet weak var mainView: CustomShadowView!
  /// movieImageView object of UIImageView
  @IBOutlet weak var movieImageView : UIImageView!
  /// lblMovieName object of CustomLabel
  @IBOutlet weak var lblMovieName: CustomLabel!
  /// btnBookMark object of CustomButton
  @IBOutlet weak var btnBookMark: CustomButton!

  override func layoutSubviews() {
    super.layoutSubviews()
  }

  //MARK: - Set Up Trending Movie Method
  /**
   - Parameter index : Int
   - Parameter vc : HomeVC
   - Parameter movieModel : MovieListModel
   */
  func setUpTrendingMovieMethod(index : Int , vc : HomeVC , movieModel : MovieListModel) {
    let url = URL(string: kGET_IMAGE_PATH + (movieModel.posterPath ?? ""))
    movieImageView.kf.indicatorType = .activity
    movieImageView.contentMode = .scaleToFill
    movieImageView.kf.setImage(with: url!)
    CustomLabel.setCustomLblFuncation(lbl: lblMovieName, lblText: movieModel.title ?? "", lblFont: Config.FONTREGULAR12, lblTextColor: Config.BlackColor, lblBgColor: Config.ClearColor, lblBorderColor: Config.ClearColor, lblBorderWidth: 0.0, lblCornerRadius: 0.0, lblAttributedText: nil, isAttributedText: false, lblTextAlignment: .center, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping)
    btnBookMark.tag = index
    if(movieModel.isFavourite == true) {
      CustomButton.setBtnFontTitleBgColorTintColorWithImage(btn: btnBookMark, andImgOfButton: kIMG_FAVOURITE, andIsImage: true, andIsOnlyImageNoTintColor: false, andBtnTintColor: Config.BTN_THEME_COLOR, andBtnTitle: "", andBtnTitleColor: Config.ClearColor, andBtnFont: Config.FONTREGULAR10, andBtnBgColor: Config.ClearColor, andBtnContentMode: .center, andBtnCornerRadius: 0.0, andBtnBorderColor: Config.ClearColor, andBtnBorderWidth: 0.0, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping, lblTextAlignMent: .center)
    } else {
      CustomButton.setBtnFontTitleBgColorTintColorWithImage(btn: btnBookMark, andImgOfButton: kIMG_BORDER_FAVOURITE, andIsImage: true, andIsOnlyImageNoTintColor: false, andBtnTintColor: Config.BTN_THEME_COLOR, andBtnTitle: "", andBtnTitleColor: Config.ClearColor, andBtnFont: Config.FONTREGULAR10, andBtnBgColor: Config.ClearColor, andBtnContentMode: .center, andBtnCornerRadius: 0.0, andBtnBorderColor: Config.ClearColor, andBtnBorderWidth: 0.0, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping, lblTextAlignMent: .center)
    }
    btnBookMark.addTarget(vc, action:#selector(vc.btnActionBookMark), for: UIControl.Event.touchUpInside)
  }
}
