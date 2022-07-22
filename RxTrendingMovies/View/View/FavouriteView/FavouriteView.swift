//
//  BookMarkView.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 08/07/22.
//

import UIKit
import Firebase

class FavouriteView: NSObject {

  ///objFavViewModel object of FavouriteViewModel
  static var objFavViewModel = FavouriteViewModel()

  //MARK: - intiallyLoadView Method
  /**
   Call this method for set intially load view functions.
   - Parameter vc : It is a object of FavouriteVC
   */
  func intiallyLoadView(vc: FavouriteVC)
  {
    /// set viewcontroller title
    vc.title = kTitleOfFavourite
    /// get Favourite data from firebase
    getFavouriteDataFromFirebase(vc: vc)
  }

  //MARK: - get Favourite Data From Firebase
  /**
   Call this method for get favourite Data list
   - Parameter vc : It is a object of FavouriteVC
   */
  func getFavouriteDataFromFirebase(vc : FavouriteVC) {
    vc.lblEmpty.isHidden = true
    vc.favListener = FavouriteView.objFavViewModel.getFavouriteData { favouriteData, error in
      if(favouriteData?.count != 0) {
        vc.lblEmpty.isHidden = true
        vc.arrFavouriteData = favouriteData ?? []
        vc.favouriteCL.reloadData()
      } else {
        vc.lblEmpty.isHidden = false
        vc.arrFavouriteData = []
        vc.favouriteCL.reloadData()
        CustomLabel.setCustomLblFuncation(lbl: vc.lblEmpty, lblText: kMSG_NO_FAVOURITE_DATA_AVAILABLE , lblFont: Config.FONTREGULAR12, lblTextColor: Config.BlackColor, lblBgColor: Config.ClearColor, lblBorderColor: Config.ClearColor, lblBorderWidth: 0.0, lblCornerRadius: 0.0, lblAttributedText: nil, isAttributedText: false, lblTextAlignment: .center, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping)
      }
    }
  }

  //MARK: - delete Favourite Data
  /**
   Call this method for delete favourite list
   - Parameter vc : It is a object of FavouriteVC
   - Parameter movieId : It is a object of Int
   - Parameter id : It is a object of Int
   */
  func deleteFavouriteData(vc : FavouriteVC , movieId : Int? , id : Int?) {
    FavouriteView.objFavViewModel.deleteFavouriteData(movieModelId: movieId) { success, error in
      if(success == true) {
      }
    }
  }

}
