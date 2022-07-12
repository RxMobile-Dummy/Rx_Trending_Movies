//
//  treandingMoviesClCell.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 08/07/22.
//

import UIKit

class treandingMoviesClCell: UICollectionViewCell {

  @IBOutlet weak var mainView: UIView!

  @IBOutlet weak var movieImageView : UIImageView!

  @IBOutlet weak var lblMovieName: CustomLabel!

  override func layoutSubviews() {
    super.layoutSubviews()
    mainView.layer.masksToBounds = true
    mainView.clipsToBounds = true
  }

  func setUpTrendingMovieMethod(index : Int , vc : HomeVC) {
    CustomView.setCustomViewBgColorCornerRadius(view: mainView, viewBgColor: Config.GrayColor, viewCornerRadius: 8.0, isCornerRadius: true)
  }
}
