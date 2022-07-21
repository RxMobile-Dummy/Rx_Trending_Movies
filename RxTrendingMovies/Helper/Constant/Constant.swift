//
//  Constant.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 30/06/22.
//

import Foundation
import UIKit

//MARK: - Main URL
let REST_SERVICE_MAIN_URL   =  "https://api.themoviedb.org/3/"

//MARK: - API URL
let kGET_TRENDING_LIST = "trending/movie/week"
let kGET_IMAGE_PATH  =   "https://image.tmdb.org/t/p/original"
let kGET_DETAILS_MOVIE  =   "movie/"

//MARK: - API Key
let kAPIKEY = "efb6cac7ab6a05e4522f6b4d1ad0fa43"

//MARK: - AppDelegate Object
let SwiftAppDelegate  = (UIApplication.shared.delegate as! AppDelegate)
var sceneDelegate = SceneDelegate()

//MARK: - View Controller Identifier Name
let kVIEWCONTROLLER_IDENTIFIER = ViewControllerIdentifier()
let kTABLEVIEW_CELL_IDENTIFIER = TableViewCellIdentifier()
let kCOLLECTIONVIEW_CELL_IDENTIFIER = CollectionViewCellIdentifier()

//MARK: - ViewController Title
let kTitleOfFavourite = "Favourite"
let kTitleOfHome = "Home"

//MARK: - Button Title
let kBTN_LOGIN = "Login"
let kBTN_FORGOTPASSWORD = "Forgot Password?"
let kBTN_SIGNUP = "Sing Up"
let kBTN_RESET_PASSWORD = "Reset Password"

//MARK: - Lable Title
let kLBL_OR  =  "OR"
let kALERT = "Alert"
let kFORGOT_PASSWORD = "Forgot Password"
let kMSG_PLEASE_ENTER_YOUR_REGISTER_EMAIL_ADDRESS  = "Please enter your register email address, so we will send you link to your email"
let kMSG_A_RESET_PASSWORD_LINK_IS_SENT_ON_YOUR_MAIL = "A reset password link is sent on your mail."

//MARK: - Textfield PlaceHolder
let kTEXTFIELD_ENTER_EMAIL = "Enter email"
let kTEXTFIELD_ENTER_PASSWORD = "Enter password"
let kTEXTFIELD_ENTER_CONFIRM_PASSWORD = "Enter confirm password"
let kTEXTFIELD_ENTER_FNAME = "Enter first name"
let kTEXTFIELD_ENTER_LNAME = "Enter last name"
let kTEXTFIELD_ENTER_MOBILE_NUMBER = "Enter mobile number"

//MARK: - Validation Message
let kMSG_PLEASE_ENTER_EMAIL   = "Please enter email"
let kMSG_PLEASE_ENTER_VALID_EMAIL   = "Please enter valid email"
let kMSG_PLEASE_ENTER_PASSWORD   = "Please enter password"
let kMSG_PLEASE_ENTER_VALID_PASSWORD   = "Please enter valid password"
let kMSG_PLEASE_ENTER_CONFRIM_PASSWORD   = "Please enter confirm password"
let kMSG_PLEASE_ENTER_VALID_CONFIRM_PASSWORD   = "Please enter valid confirm password"
let kMSG_PASSWORD_CONFIRMPASSWORD_DO_NOT_MATCH   = "Password and confirm password do not match"
let kMSG_NO_INTERNET_CONNECTION   = "No internet connection check your network settings and try again."
let kMSG_NO_TRENDING_MOVIE_AVAILABLE  = "No Trending Movie Data Available"
let kMSG_NO_FAVOURITE_DATA_AVAILABLE  = "No Favourite Data Available"

//MARK: - Firebase Collection Name
let kFAVOURITEDATA = "FavouriteData"

//MARK: - Image Name
let kIMG_BACK_ARROW = "img_back_arrow"
let kIMG_VISIBILITY_OFF = "img_visibility_off"
let kIMG_VISIBILITY = "img_visibility"
let kIMG_FAVOURITE = "img_fill_fav"
let kIMG_BORDER_FAVOURITE = "img_border_fav"
let kIMG_HOME = "img_home"
let kIMG_PLACEHOLDER = "img_placeholder"

//MARK: - Error Handle
var kisLogin : Bool = false
let kError = NSError(domain: "RxMovie", code: 401, userInfo: ["status_code": 7, "status_message": "Invalid API key: You must be granted a valid key.", "success": false])

//MARK: - API Parameters
let kfield_adult  = "adult"
let kfield_backdrop_path  = "backdrop_path"
let kfield_id = "id"
let kfield_media_type  = "media_type"
let kfield_title  = "title"
let kfield_original_language  = "original_language"
let kfield_original_title  = "original_title"
let kfield_overview  = "overview"
let kfield_popularity  = "popularity"
let kfield_poster_path  = "poster_path"
let kfield_release_date  = "release_date"
let kfield_video  = "video"
let kfield_vote_average  = "vote_average"
let kfield_vote_count  = "vote_count"
let kfield_isFavourite = "isFavourite"

//MARK: - UserDefault
let kUSERDEFAULT   = UserDefaults.standard
let kCurrentUser  = "CurrentUser"

//MARK: - Storyboard Name
let mainStoryboardName = "Main"
