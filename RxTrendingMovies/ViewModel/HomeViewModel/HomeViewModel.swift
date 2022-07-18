//
//  HomeViewModel.swift
//  RxTreandingMovies
//
//  Created by Ranjana Patidar on 08/07/22.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import SwiftyJSON

class HomeViewModel: NSObject {
  
  func getTreandingMovies(completion: @escaping ([MovieListModel]?, Error?) -> Void) {
    
    if ReachabilityC.isConnectedToNetwork()
    {
      Utility.showProgressView()
      let params : String = "api_key=\(kAPIKEY)"
      HomeView.baseService.GetAPICall(reqURL: kGET_TRENDING_LIST, appendParams: params, modelName: MovieModel.self) { resultData, error in
        let data = resultData
        if(data?.results?.count != 0) {
          completion(data?.results , error)
        } else {
          completion([] , error)
        }
      }
    }
  }

  func getFavouriteData(completion: @escaping ([MovieListModel]?, Error?) -> Void) -> ListenerRegistration{
    do {
      let televisitListener = Firestore.firestore().collection("FavouriteData").addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("No documents")
          return
        }

        let movieData = documents.map { queryDocumentSnapshot -> MovieListModel in
          let data = queryDocumentSnapshot.data()
          let strAdult = data["adult"] as? Bool ?? false
          let strBackDropPath = data["backdrop_path"] as? String ?? ""
          let strId = data["id"] as? Int ?? 0
          let strMediaType = data["media_type"] as? String ?? ""
          let strTitle = data["title"] as? String ?? ""
          let strOriginalLang = data["original_language"] as? String ?? ""
          let strOriginalTitle = data["original_title"] as? String ?? ""
          let strOverView = data["overview"] as? String ?? ""
          let strPopularity = data["popularity"] as? Double ?? 0.0
          let strPosterPath = data["poster_path"] as? String ?? ""
          let strReleaseDate = data["release_date"] as? String ?? ""
          let strVideo = data["video"] as? Bool ?? false
          let strVoteAverage = data["vote_average"] as? Double ?? 0.0
          let strVoteCount = data["vote_count"] as? Double ?? 0.0
          let movieModelData : MovieListModel = MovieListModel(adult: strAdult, backdropPath: strBackDropPath, id: strId, mediaType: strMediaType, title: strTitle, originalLanguage: strOriginalLang, originalTitle: strOriginalTitle, overview: strOverView, popularity: strPopularity, posterPath: strPosterPath, releaseDate: strReleaseDate, video: strVideo, voteAverage: strVoteAverage, voteCount: strVoteCount )
          movieModelData.isFavourite = data["isFavourite"] as? Bool ?? false
          print(movieModelData)
          return movieModelData
        }
        completion(movieData , nil)
      }
      return televisitListener
    }
  }

  func saveBookMarkMovieIntoFireBase(movieModel : MovieListModel, completion: @escaping (Bool?, Error?) -> Void) {
    do {
      let db = Firestore.firestore()
      if (movieModel.isFavourite == false || movieModel.isFavourite == nil) {
        movieModel.isFavourite = true
        let data = try JSONEncoder().encode(movieModel)
        let json = (try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] ?? nil)!
        db.collection("FavouriteData").document("\(movieModel.id!)").setData(json) { err in
          if let err = err {
            completion(false  , err as NSError)
          } else {
            completion(true  , nil)
          }
        }
      } else {
        movieModel.isFavourite = false
        db.collection("FavouriteData").document("\(movieModel.id!)").updateData(["isFavourite": false]) { err in
          if let err = err {
            completion(false  , err as NSError)
          } else {
            completion(true  , nil)
          }
        }
      }
    } catch {
      print(error)
    }
  }
}
