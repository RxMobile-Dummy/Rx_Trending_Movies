//
//  TrendingMovieService.swift
//  RxTrendingMovies
//
//  Created by Devangi Prajapati on 14/07/22.
//

import Foundation
import UIKit
import SwiftyJSON

struct TrendingMovieListService {

  static var objBaseService = BaseService()

  func getTrendingMoviesList<T:Decodable>(strURL : String , params : String , completion: @escaping (T?, NSError?) -> Void) {
    TrendingMovieListService.objBaseService.GetAPICall(reqURL: strURL, appendParams: params, modelName: MovieModel.self) { result, error in
      if(error == nil) {
        //completion(result , error)
      } else {
       // completion(result , error)
      }
    }
  }
}
