//
//  ForgotPasswordTestCase.swift
//  RxTrendingMoviesTests
//
//  Created by Devangi Prajapati on 22/07/22.
//

import XCTest
@testable import RxTrendingMovies

class ForgotPasswordTestCase: XCTestCase {
  
  func test_ForgotPasswrodEmailValidation_With_EmptyString_Returns_ValidationFailure() {
    
    /// ARRANGE
    let validation = Validation()
    
    /// ACT
    let result = validation.checkEmptyAndValidEmailValidation(email: "")
    
    /// ASSERT
    XCTAssertFalse(result.isEmpty)
    XCTAssertNotNil(result)
    XCTAssertEqual(result, kMSG_PLEASE_ENTER_EMAIL)
  }
  
  func test_ForgotPasswrodEmail_Validation_Returns_ValidationFailure() {
    
    /// ARRANGE
    let validation = Validation()
    
    /// ACT
    let result = validation.checkEmptyAndValidEmailValidation(email: "test")
    
    /// ASSERT
    XCTAssertFalse(result.isEmpty)
    XCTAssertNotNil(result)
    XCTAssertEqual(result, kMSG_PLEASE_ENTER_VALID_EMAIL)
  }
  
  func test_ForgotPasswrodEmail_Validation_With_Returns_ValidationSuccess() {
    
    /// ARRANGE
    let validation = Validation()
    
    /// ACT
    let result = validation.checkEmptyAndValidEmailValidation(email: "devangi.prajapati@radixweb.com")
    
    /// ASSERT
    XCTAssertTrue(result.isEmpty)
    XCTAssertEqual(result, "")
  }
  
}
