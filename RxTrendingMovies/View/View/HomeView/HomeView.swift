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
    HomeView.objHomeViewModel.getTreandingMovies() { movieData, error in
      if(movieData?.count != 0) {
        vc.arrTrendingMovieList = movieData ?? []
        vc.treandingMovieCl.reloadData()
        Utility.hideProgressView()
      } else {
        Utility.hideProgressView()
      }
    }
  }

  //MARK: - save Favourite Data into Firebase
  /**
   Call this method for save Favourite Datainto Firebase
   - Parameter vc : It is a object of HomeVC
   - Parameter index : It is a object of Int
   */
  func saveBookMarkDataIntoFirebase(vc : HomeVC , index : Int ) {
    HomeView.objHomeViewModel.saveBookMarkMovieIntoFireBase(movieModel: vc.arrTrendingMovieList[index]) { success, error in
      if(success == true) {
        vc.treandingMovieCl.reloadItems(at: [IndexPath(item: index, section: 0)])
      }
    }
  }
}
