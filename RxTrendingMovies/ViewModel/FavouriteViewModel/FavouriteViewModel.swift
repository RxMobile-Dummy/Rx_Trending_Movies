//
//  BookMarkViewModel.swift
//  RxTreandingMovies
//
//  Created by Ranjana Patidar on 08/07/22.
//

import Foundation
import Firebase

class FavouriteViewModel: NSObject {

  func getFavouriteData(completion: @escaping ([MovieListModel]?, Error?) -> Void) -> ListenerRegistration{
    do {
      let televisitListener = Firestore.firestore().collection("FavouriteData").whereField("isFavourite", isEqualTo: true).addSnapshotListener { (querySnapshot, error) in
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
          return MovieListModel(adult: strAdult, backdropPath: strBackDropPath, id: strId, mediaType: strMediaType, title: strTitle, originalLanguage: strOriginalLang, originalTitle: strOriginalTitle, overview: strOverView, popularity: strPopularity, posterPath: strPosterPath, releaseDate: strReleaseDate, video: strVideo, voteAverage: strVoteAverage, voteCount: strVoteCount )
        }
        completion(movieData , nil)
      }
      return televisitListener
    }
  }

  func deleteFavouriteData(movieModelId : Int? , completion: @escaping (Bool?, Error?) -> Void){
    do {
      Firestore.firestore().collection("FavouriteData").document("\(movieModelId ?? 0)").updateData(["isFavourite": false]) { err in
        if let err = err {
          completion(false  , err as NSError)
        } else {
          completion(true , nil)
        }
      }
    }
  }
}
