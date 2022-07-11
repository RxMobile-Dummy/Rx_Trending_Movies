//
//  Constant.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 30/06/22.
//

import Foundation
import UIKit

//MARK: - Main URL
//let REST_SERVICE_URL                  =   "http://www.demoaws.picsy.in"
//let REST_SERVICE_URL                  =   "http://www.fd.picsydev.com"
//let REST_SERVICE_URL                  =   "http://www.picsyv6.picsydev.com"
//let REST_SERVICE_URL                  =   "http://staging.picsydev.com"
//let REST_SERVICE_URL                  =   "https://www.picsy.in"
let REST_SERVICE_URL                  =   "http://www.picsyqa.picsydev.com"
let REST_SERVICE_MAIN_URL   =  REST_SERVICE_URL + "/api/"

//MARK: - API URL
let kPOST_LOGIN_URL = "user/login"

//MARK: - AppDelegate Object
let SwiftAppDelegate  = (UIApplication.shared.delegate as! AppDelegate)

//MARK: - View Controller Identifier Name
let kVIEWCONTROLLER_IDENTIFIER = ViewControllerIdentifier()
let kTABLEVIEW_CELL_IDENTIFIER = TableViewCellIdentifier()

//MARK: - Button Title
let kBTN_LOGIN = "Login"
let kBTN_FORGOTPASSWORD = "Forgot Password?"
let kBTN_SIGNUP = "Sing Up"

//MARK: - Lable Title
let kLBL_OR  =  "OR"
let kALERT = "Alert"
let kFORGOT_PASSWORD = "Forgot Password"

//MARK: - Textfield PlaceHolder
let kTEXTFIELD_ENTER_EMAIL = "Enter email"
let kTEXTFIELD_ENTER_PASSWORD = "Enter password"
let kTEXTFIELD_ENTER_CONFIRM_PASSWORD = "Enter confirm password"
let kTEXTFIELD_ENTER_FNAME = "Enter firstName"
let kTEXTFIELD_ENTER_LNAME = "Enter lastName"
let kTEXTFIELD_ENTER_MOBILE_NUMBER = "Enter mobile number"

//MARK: - Validation Message
let kMSG_PLEASE_ENTER_EMAIL   = "Please enter email"
let kMSG_PLEASE_ENTER_VALID_EMAIL   = "Please enter valid email"
let kMSG_PLEASE_ENTER_PASSWORD   = "Please enter password"
let kMSG_PLEASE_ENTER_VALID_PASSWORD   = "Please enter valid password"
let kMSG_PLEASE_ENTER_CONFRIM_PASSWORD   = "Please enter confirm password"
let kMSG_PLEASE_ENTER_VALID_CONFIRM_PASSWORD   = "Please enter valid confirm password"
let kMSG_PASSWORD_CONFIRMPASSWORD_DO_NOT_MATCH   = "Password and confirm password do not match"

//MARK: - Image Name
let kIMG_BACK_ARROW = "img_back_arrow"
let kIMG_VISIBILITY_OFF = "img_visibility_off"
let kIMG_VISIBILITY = "img_visibility"
let kIMG_BOOKMARK = "img_bookmark"
let kIMG_HOME = "img_home"


var kisLogin : Bool = false
let kError = NSError(domain: "Picsy", code: 101, userInfo: nil)

//MARK: - API Parameters
///Login Parameters
let KUSERNAME   = "username"
let KPASSWORD = "password"
let KDEVICEID  = "device_id"
let KPLATFORM = "platform"
let KDEVICENAME    = "device_name"
let KDEVICEOSVERSION    = "device_os_version"
let KACC_TOKEN  = "acc_token"

//MARK: - UserDefault
let kUSERDEFAULT                = UserDefaults.standard
