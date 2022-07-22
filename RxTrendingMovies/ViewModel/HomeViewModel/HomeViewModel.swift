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

  //MARK: - Get Trending Movies Method
  /**
     Call this method for get trending movies list from API
     - Parameter : completion call back of MovieModel and Error
   */
  func getTreandingMovies(completion: @escaping (MovieModel?, Error? ) -> Void) {
    
    if ReachabilityC.isConnectedToNetwork()
    {
      Utility.showProgressView()
      let params : String = "api_key=\(kAPIKEY)"
      HomeView.baseService.GetAPICall(reqURL: kGET_TRENDING_LIST, appendParams: params, modelName: MovieModel.self) { resultData, error in
        let data = resultData
        if(data != nil) {
          completion(data , error)
        } else {
          completion(nil , error)
        }
      }
    }
  }

  //MARK: - Get Favourite Data
  /**
     Call this method for get favourite data from firebase
     - Parameter : completion call back of [MovieListModel] and Error
     - Return : ListenerRegistration
   */
  func getFavouriteData(completion: @escaping ([MovieListModel]?, Error?) -> Void) -> ListenerRegistration{
    do {
      let televisitListener = Firestore.firestore().collection(kFAVOURITEDATA).addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("No documents")
          return
        }

        let movieData = documents.map { queryDocumentSnapshot -> MovieListModel in
          let data = queryDocumentSnapshot.data()
          let strAdult = data[kfield_adult] as? Bool ?? false
          let strBackDropPath = data[kfield_backdrop_path] as? String ?? ""
          let strId = data[kfield_id] as? Int ?? 0
          let strMediaType = data[kfield_media_type] as? String ?? ""
          let strTitle = data[kfield_title] as? String ?? ""
          let strOriginalLang = data[kfield_original_language] as? String ?? ""
          let strOriginalTitle = data[kfield_original_title] as? String ?? ""
          let strOverView = data[kfield_overview] as? String ?? ""
          let strPopularity = data[kfield_popularity] as? Double ?? 0.0
          let strPosterPath = data[kfield_poster_path] as? String ?? ""
          let strReleaseDate = data[kfield_release_date] as? String ?? ""
          let strVideo = data[kfield_video] as? Bool ?? false
          let strVoteAverage = data[kfield_vote_average] as? Double ?? 0.0
          let strVoteCount = data[kfield_vote_count] as? Double ?? 0.0
          let movieModelData : MovieListModel = MovieListModel(adult: strAdult, backdropPath: strBackDropPath, id: strId, mediaType: strMediaType, title: strTitle, originalLanguage: strOriginalLang, originalTitle: strOriginalTitle, overview: strOverView, popularity: strPopularity, posterPath: strPosterPath, releaseDate: strReleaseDate, video: strVideo, voteAverage: strVoteAverage, voteCount: strVoteCount )
          movieModelData.isFavourite = data[kfield_isFavourite] as? Bool ?? false
          return movieModelData
        }
        completion(movieData , nil)
      }
      return televisitListener
    }
  }

  //MARK: - Save Favourite Movie Into Firebase
  /**
     Call this method for save favourite movie into firebase
     - Parameter : movieModel object of MovieListModel
     - Parameter : completion call back of Bool and Error
   */
  func saveFavouriteMovieIntoFireBase(movieModel : MovieListModel, completion: @escaping (Bool?, Error?) -> Void) {
    do {
      let db = Firestore.firestore()
      if (movieModel.isFavourite == false || movieModel.isFavourite == nil) {
        movieModel.isFavourite = true
        let data = try JSONEncoder().encode(movieModel)
        let json = (try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] ?? nil)!
        db.collection(kFAVOURITEDATA).document("\(movieModel.id!)").setData(json) { err in
          if let err = err {
            completion(false  , err as NSError)
          } else {
            completion(true  , nil)
          }
        }
      } else {
        movieModel.isFavourite = false
        db.collection(kFAVOURITEDATA).document("\(movieModel.id!)").updateData([kfield_isFavourite: false]) { err in
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
