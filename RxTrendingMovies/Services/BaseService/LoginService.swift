//
//  LoginService.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 06/07/22.
//

import UIKit
import Alamofire
import Firebase

public class LoginService: NSObject {
  
  func  login <T:Codable>(loginRequest: LoginReqParams,modelName : T.Type, completion: @escaping (T?, NSError?) -> Void) {

    var params = [String : Any]()
    params[KUSERNAME] = loginRequest.username ?? ""
    params[KPASSWORD] = loginRequest.password ?? ""
    params[KDEVICEID] = "\(UIDevice.current.identifierForVendor!.uuidString)"
    params[KPLATFORM] = "iphone"
    params[KDEVICENAME] = UIDevice.current.model
    params[KDEVICEOSVERSION] = UIDevice.current.systemVersion
    params[KACC_TOKEN]  = "fyJaZ22Q3Xc:APA91bE2PeB8h_TLrQgrgwyefkJtVUufOqFokMlOAm33AOGwGONszVs48y2jUvJ1lfCHdZE5nlqHMYmPHEqHxp-9zHgm9-I_FSDJXQvulwpYuMAm1Y9FKa5W-P-3RQTlHFLgg26ol5qa"
    params["country_code"] = "91"
    let urls = REST_SERVICE_MAIN_URL + kPOST_LOGIN_URL

    let headers: HTTPHeaders = ["Authorization":"Bearer a1a0a7638164f5110b681c1827fd642b7fcd74d4",
                                "x-api-version":"v2"]


    AF.request(urls, method: .post
               , parameters: params, encoding: URLEncoding.default, headers: headers, interceptor:nil).validate(statusCode: [200]).responseJSON { (response) in
      print(response.result)
      switch response.result {
      case .failure(let error):
        completion(nil, kError)
        print(error)

      case .success( _):
        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let result = try decoder.decode(T.self, from: response.data!)
          completion(result, nil)

        } catch {
          print(error)
          completion(nil, kError)
        }
      }
    }
  }


  struct LoginResponse : Decodable {

      let user: User
      let status: Int
      let success : Bool
      let message : String
  }

  struct User : Decodable {
      let id : Int
      let firstName, lastName, surName, username : String
  }
}
