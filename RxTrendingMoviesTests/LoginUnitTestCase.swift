//
//  LoginUnitTestCase.swift
//  RxTrendingMoviesTests
//
//  Created by Devangi Prajapati on 06/07/22.
//

import XCTest
@testable import RxTrendingMovies

class LoginUnitTestCase: XCTestCase {

    var createUser: CreateUserModel!
    
  override func setUp() {
      createUser = CreateUserModel()
  }

  func test_LoginEmailValidation_With_EmptyString_Returns_ValidationFailure() {

    /// ARRANGE
    let validation = Validation()

    /// ACT
    let result = validation.checkEmptyAndValidEmailValidation(email: "")

    /// ASSERT
    XCTAssertFalse(result.isEmpty)
    XCTAssertNotNil(result)
    XCTAssertEqual(result, kMSG_PLEASE_ENTER_EMAIL)
  }

  func test_LoginValidEmail_Validation_Returns_ValidationFailure() {

    /// ARRANGE
    let validation = Validation()

    /// ACT
    let result = validation.checkEmptyAndValidEmailValidation(email: "test")

    /// ASSERT
    XCTAssertFalse(result.isEmpty)
    XCTAssertNotNil(result)
    XCTAssertEqual(result, kMSG_PLEASE_ENTER_VALID_EMAIL)
  }

  func test_LoginEmail_Validation_With_Returns_ValidationSuccess() {

    /// ARRANGE
    let validation = Validation()

    /// ACT
    let result = validation.checkEmptyAndValidEmailValidation(email: "devangi.prajapati@radixweb.com")

    /// ASSERT
    XCTAssertTrue(result.isEmpty)
    XCTAssertEqual(result, "")
  }

  func test_LoginPassword_Validation_With_EmptyStrin_Returns_ValidationFailure() {
    /// ARRANGE
    let validation = Validation()

    /// ACT
    let result = validation.checkEmptyAndValidPasswordValidation(password: "")

    /// ASSERT
    XCTAssertFalse(result.isEmpty)
    XCTAssertNotNil(result)
    XCTAssertEqual(result, kMSG_PLEASE_ENTER_PASSWORD)
  }

  func test_LoginValidPassword_Validation_Returns_ValidationFailure() {
    /// ARRANGE
    let validation = Validation()

    /// ACT
    let result = validation.checkEmptyAndValidPasswordValidation(password: "123")

    /// ASSERT
    XCTAssertFalse(result.isEmpty)
    XCTAssertNotNil(result)
    XCTAssertEqual(result, kMSG_PLEASE_ENTER_VALID_PASSWORD)
  }

  func test_LoginPassword_Validation_With_Returns_ValidationSuccess() {
    /// ARRANGE
    let validation = Validation()

    /// ACT
    let result = validation.checkEmptyAndValidPasswordValidation(password: "Radixweb8")

    /// ASSERT
    XCTAssertTrue(result.isEmpty)
    XCTAssertEqual(result, "")
  }

//    func test_loginAPI_with_error() {
//        let testExpectation = self.expectation(description: "Expected login completion handler to be called")
//        LoginViewModel.signIn(createUser: CreateUserModel(email: "ranjana.patidar@radixweb.com", password: "Radixweb@80")) { success, user, error  in
//            if(error != nil) {
//                XCTFail("Expected completion to be called with some server error")
//                testExpectation.fulfill()
//            }
//            testExpectation.fulfill()
//        }
//        waitForExpectations(timeout: 10, handler: nil)
//    }
//        
//    func test_loginAPI_with_success() {
//        LoginViewModel.signIn(createUser: CreateUserModel(email: createUser.email ?? "", password: createUser.password ?? "")) { success, user, error  in
//            let testExpectation = self.expectation(description: "Expected login completion handler to be called")
//            if(success == true) {
//                XCTFail("Expected completion to be called with a user")
//                testExpectation.fulfill()
//            }
//            testExpectation.fulfill()
//        }
//        waitForExpectations(timeout: 1, handler: nil)
//    }
 
}
