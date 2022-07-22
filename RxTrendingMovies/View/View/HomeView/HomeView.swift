//
//  HomeView.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 08/07/22.
//

import UIKit

class HomeView: NSObject {

  static var baseService = BaseService()

  ///Object of Home View Model.
  static var objHomeViewModel = HomeViewModel()

  //MARK: - intiallyLoadView Method
  /**
   Call this method for set intially load view functions.
   - Parameter vc : It is a object of HomeVC
   */
  func intiallyLoadView(vc: HomeVC)
  {
    /// set viewController Title
    vc.title = kTitleOfHome
    /// get Trending Movie List for HomeVC Screen
    getTrendingMovieData(vc: vc)
  }

  //MARK: - get Trending Movie List API Call
  /**
   Call this method for set intially load view functions.
   - Parameter vc : It is a object of HomeVC
   */
  func getTrendingMovieData(vc : HomeVC) {
    vc.lblEmptyMovie.isHidden = true
    HomeView.objHomeViewModel.getTreandingMovies() { movieData, error in
      if(movieData != nil) {
        vc.arrTrendingMovieList = movieData?.results ?? []
        vc.lblEmptyMovie.isHidden = true
        vc.treandingMovieCl.reloadData()
        Utility.hideProgressView()
      } else {
        Utility.hideProgressView()
        vc.arrTrendingMovieList = []
        vc.lblEmptyMovie.isHidden = false
        CustomLabel.setCustomLblFuncation(lbl: vc.lblEmptyMovie, lblText: kMSG_NO_TRENDING_MOVIE_AVAILABLE, lblFont: Config.FONTREGULAR12, lblTextColor: Config.BlackColor, lblBgColor: Config.ClearColor, lblBorderColor: Config.ClearColor, lblBorderWidth: 0.0, lblCornerRadius: 0.0, lblAttributedText: nil, isAttributedText: false, lblTextAlignment: .center, lblNumberOfLine: 0, lblLineBreakMode: .byWordWrapping)
      }
    }
  }

  //MARK: - save Favourite Data into Firebase
  /**
   Call this method for save Favourite Datainto Firebase
   - Parameter vc : It is a object of HomeVC
   - Parameter index : It is a object of Int
   */
  func saveFavouriteDataIntoFirebase(vc : HomeVC , index : Int ) {
    HomeView.objHomeViewModel.saveFavouriteMovieIntoFireBase(movieModel: vc.arrTrendingMovieList[index], completion: { success, error in
      if(success == true) {
        vc.treandingMovieCl.reloadItems(at: [IndexPath(item: index, section: 0)])
      }
    })
  }

  //MARK: - Get Favourite Data From Firebase
  /**
   Call this method for get Favourite Data From Firebase
   - Parameter vc : It is a object of HomeVC
   */
  func getFavouriteDataFromFirebase(vc : HomeVC) {
    if(vc.arrTrendingMovieList.count > 0) {
      vc.isFavListener =  HomeView.objHomeViewModel.getFavouriteData { favMovieData, error in
        if((favMovieData?.count ?? 0 ) > 0) {
          favMovieData?.forEach({ element in
            let index = vc.arrTrendingMovieList.firstIndex(where: {$0.id == element.id})
            if(element.isFavourite == false) {
              vc.arrTrendingMovieList[index ?? 0].isFavourite = false
            } else {
              vc.arrTrendingMovieList[index ?? 0].isFavourite = true
            }
            vc.treandingMovieCl.reloadItems(at: [IndexPath(item: index ?? 0, section: 0)])
          })
        }
      }
    }
  }
}
