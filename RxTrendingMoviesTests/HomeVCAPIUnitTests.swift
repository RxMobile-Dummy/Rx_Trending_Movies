//
//  HomeVCUnitTests.swift
//  RxTrendingMoviesTests
//
//  Created by Devangi Prajapati on 18/07/22.
//

import XCTest
import Mocker
@testable import RxTrendingMovies

class HomeVCAPIUnitTests: XCTestCase {

  var homeViewModel = HomeViewModel()
  var isNetworkEnable = ReachabilityC.isConnectedToNetwork()

  func test_TrendingAPICall_Success() {

    do {
      try XCTSkipUnless(isNetworkEnable, "Network connectivity needed for this test.")
    } catch {

    }

    //ARRANGE
    let urlString = REST_SERVICE_MAIN_URL + kGET_TRENDING_LIST + "?" + "api_key=\(kAPIKEY)"
    let apiEndpoint = URL(string: urlString)!

    let expectedMovie = MovieModel(page: 1, results: [MovieListModel(adult: false, backdropPath: "/9eAn20y26wtB3aet7w9lHjuSgZ3.jpg", id: 507086, mediaType: "movie", title: "Jurassic World Dominion", originalLanguage: "en", originalTitle: "Jurassic World Dominion", overview: "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history’s most fearsome creatures.", popularity: 14064.562, posterPath: "/kAVRgw7GgK1CfYEJq8ME6EvRIgU.jpg", releaseDate: "2022-07-08", video: false, voteAverage: 6.774, voteCount: 1072)], total_pages: 0, total_results: 0)

    let requestExpectation = expectation(description: "TrendingAPICallSuccess")

    //ACT
    let mockedData = try! JSONEncoder().encode(expectedMovie)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
    mock.register()

    homeViewModel.getTreandingMovies { movieData, error in
      defer {
        requestExpectation.fulfill() }
      do {
        if let error = error {
          throw error
        }
        /// ASSERT
        XCTAssertNotNil(movieData)
        XCTAssertNotNil(movieData?.results)
        XCTAssertEqual(movieData, expectedMovie)
        XCTAssertEqual(movieData?.results?.first?.id, expectedMovie.results?.first?.id)
      } catch {
        XCTFail(error.localizedDescription)
      }
    }

    wait(for: [requestExpectation], timeout: 20.0)
  }


  func test_TrendingAPICall_Error() {

    do {
      try XCTSkipUnless(isNetworkEnable, "Network connectivity needed for this test.")
    } catch {

    }

    //ARRANGE
    let urlString = REST_SERVICE_MAIN_URL + kGET_TRENDING_LIST + "?" + "api_key=\(kAPIKEY)"
    let apiEndpoint = URL(string: urlString)!

    let expectedMovie : MovieModel? = nil
    let errorExpectation = expectation(description: "error")

    //ACT
    let mockedData = try! JSONEncoder().encode(expectedMovie)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 401, data: [.get: mockedData])
    mock.register()

    homeViewModel.getTreandingMovies { movieData, error in
      do {
        if let error = error as NSError?{
          XCTAssertNil(movieData)
          XCTAssertNotNil(error.userInfo)
          XCTAssertTrue(((error.userInfo["success"] ?? true) as! Bool == false))
          XCTAssertEqual(error.code, 401)
          errorExpectation.fulfill()
        }
      }
    }
    wait(for: [errorExpectation], timeout: 20.0)
  }
}
