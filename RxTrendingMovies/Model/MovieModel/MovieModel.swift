//
//  MovieModel.swift
//  RxTrendingMovies
//
//  Created by Devangi Prajapati on 14/07/22.
//

import Foundation

// MARK: - MovieListModel DataClass
class MovieModel : Codable
{

  let page: Int?
  let results : [MovieListModel]?
  let total_pages : Int?
  let total_results : Int?

  enum CodingKeys: String, CodingKey {
       case page, total_pages, results, total_results
    }

  init(page: Int? = 0, results: [MovieListModel]? = [], total_pages : Int? = 0 , total_results: Int? = 0) {
    self.page = page
    self.results = results
    self.total_pages = total_pages
    self.total_results = total_results
  }
}

class MovieListModel : Codable {
  let adult : Bool?
  let backdropPath : String?
  let id : Int?
  let mediaType : String?
  let title : String?
  let originalLanguage : String?
  let originalTitle : String?
  let overview : String?
  let popularity : Double?
  let posterPath : String?
  let releaseDate : String?
  let video : Bool?
  let voteAverage : Double?
  let voteCount : Double?
  var isFavourite : Bool? = false

  enum CodingKeys: String, CodingKey {
    case adult , id , title , overview , popularity , video
    case backdropPath = "backdrop_path"
    case mediaType = "media_type"
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
    case isFavourite
  }

  init(adult: Bool? , backdropPath: String? , id: Int? , mediaType: String?  , title: String?   , originalLanguage: String? , originalTitle: String?   , overview: String?
       , popularity : Double?,  posterPath : String? , releaseDate : String? ,  video : Bool? ,  voteAverage : Double? , voteCount : Double? , isFavourite : Bool? = false ) {

    self.adult = adult
    self.backdropPath = backdropPath
    self.id = id
    self.mediaType = mediaType
    self.title = title
    self.originalLanguage = originalLanguage
    self.originalTitle = originalTitle
    self.overview = overview
    self.popularity = popularity
    self.posterPath = posterPath
    self.releaseDate = releaseDate
    self.video = video
    self.voteAverage = voteAverage
    self.voteCount = voteCount
    self.isFavourite = isFavourite
  }

}
