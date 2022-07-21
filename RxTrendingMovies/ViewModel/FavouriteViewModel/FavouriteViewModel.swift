//
//  BookMarkViewModel.swift
//  RxTreandingMovies
//
//  Created by Ranjana Patidar on 08/07/22.
//

import Foundation
import Firebase

class FavouriteViewModel: NSObject {

  //MARK: - Get Favourite Data
  /**
    Call this method for get favourite data from firebase
   - Parameter : completion call back of List of MovieListModel and Error
   */
  func getFavouriteData(completion: @escaping ([MovieListModel]?, Error?) -> Void) -> ListenerRegistration{
    do {
      let televisitListener = Firestore.firestore().collection(kFAVOURITEDATA).whereField(kfield_isFavourite, isEqualTo: true).addSnapshotListener { (querySnapshot, error) in
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
          return MovieListModel(adult: strAdult, backdropPath: strBackDropPath, id: strId, mediaType: strMediaType, title: strTitle, originalLanguage: strOriginalLang, originalTitle: strOriginalTitle, overview: strOverView, popularity: strPopularity, posterPath: strPosterPath, releaseDate: strReleaseDate, video: strVideo, voteAverage: strVoteAverage, voteCount: strVoteCount )
        }
        completion(movieData , nil)
      }
      return televisitListener
    }
  }

  //MARK: - Delete Favourite Data
  /**
    Call this method for delete favourite data 
   - Parameter : completion call back of List of MovieListModel and Error
   */
  func deleteFavouriteData(movieModelId : Int? , completion: @escaping (Bool?, Error?) -> Void){
    do {
      Firestore.firestore().collection(kFAVOURITEDATA).document("\(movieModelId ?? 0)").updateData([kfield_isFavourite: false]) { err in
        if let err = err {
          completion(false  , err as NSError)
        } else {
          completion(true , nil)
        }
      }
    }
  }
}
