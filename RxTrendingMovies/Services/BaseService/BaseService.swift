//
//  BaseService.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 06/07/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class BaseService: NSObject {

  func  PostAPICall <T:Decodable,R>(reqURL:String, request: R, modelName : T.Type, completion: @escaping (T?, NSError?) -> Void) {
      let urls = REST_SERVICE_MAIN_URL + reqURL
      let headers = getHeaders()

      AF.request(urls, method: .post
          , parameters: request as? Parameters, encoding: URLEncoding.default, headers: headers, interceptor:nil).validate(statusCode: [200]).responseJSON { (response) in
              switch response.result {
              case .failure(let error):
                  completion(nil, kError)
                  print(error)
              case .success( _):
                  do {
                      let decoder = JSONDecoder()
                      decoder.keyDecodingStrategy = .useDefaultKeys
                      let result = try decoder.decode(modelName.self, from: response.data!)
                      completion(result, nil)
                  } catch {
                      print(error)
                      completion(nil, kError)
                  }
              }
      }
  }


  func GetAPICall <T:Codable>(reqURL:String ,appendParams: String, modelName : T.Type, completion: @escaping (T?, NSError?) -> Void) {
      let urls = REST_SERVICE_MAIN_URL + reqURL + "?" + appendParams
      AF.request(urls, method: .get
          , parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor:nil).validate(statusCode: [200]).responseJSON { (response) in
              switch response.result {
              case .failure(let error):
                  completion(nil, kError)
                  print(error)
              case .success( _):
                  do {
                      let decoder = JSONDecoder()
                      decoder.keyDecodingStrategy = .useDefaultKeys
                      let result = try decoder.decode(T.self, from: response.data!)
                      completion(result, nil)
                  } catch {
                      print(error)
                      completion(nil, kError)
                  }
              }
      }
  }

  func getHeadersWithAuthorizationKey() -> HTTPHeaders {
      var headers = HTTPHeaders()
      if kisLogin {
          headers = ["Authorization":"Bearer 337fa497b7f53444ea977c904f939d25a6337c9d"  ]
      }
      else
      {
          headers = ["Content-Type":"application/x-www-form-urlencoded"
          ]
      }

      return headers

  }


  func getHeaders() -> HTTPHeaders {
      var headers = HTTPHeaders()
      if kisLogin {
          let strAccessToken = kUSERDEFAULT.object(forKey: "Access_Token")
          headers = ["Authorization":"Bearer \(strAccessToken ?? "")",
                     "x-api-version":"v2"]
      }
      else
      {
          headers = ["Content-Type":"application/x-www-form-urlencoded"]
      }
      return headers
  }

}
