//
//  loginUnitTestCase.swift
//  RxManagementTests
//
//  Created by Devangi Prajapati on 06/07/22.
//

import XCTest
@testable import RxManagement

class loginUnitTestCase: XCTestCase {

  func test_LoginEmailValidation_With_EmptyString_Returns_ValidationFailure() {

    /// ARRAGE
    let validation = Validation()

    /// ACT
    let result = validation.checkEmptyAndValidEmailValidation(email: "")

    /// ASSERT
    XCTAssertFalse(result.isEmpty)
    XCTAssertNotNil(result)
    XCTAssertEqual(result, kMSG_PLEASE_ENTER_EMAIL)
  }

  func test_LoginValidEmail_Validation_Returns_ValidationFailure() {

    /// ARRAGE
    let validation = Validation()

    /// ACT
    let result = validation.checkEmptyAndValidEmailValidation(email: "test")

    /// ASSERT
    XCTAssertFalse(result.isEmpty)
    XCTAssertNotNil(result)
    XCTAssertEqual(result, kMSG_PLEASE_ENTER_VALID_EMAIL)
  }

  func test_LoginEmail_Validation_With_Returns_ValidationSuccess() {

    /// ARRAGE
    let validation = Validation()

    /// ACT
    let result = validation.checkEmptyAndValidEmailValidation(email: "devangi.prajapati@radixweb.com")

    /// ASSERT
    XCTAssertTrue(result.isEmpty)
    XCTAssertEqual(result, "")
  }

  func test_LoginPassword_Validation_With_EmptyStrin_Returns_ValidationFailure() {
    /// ARRAGE
    let validation = Validation()

    /// ACT
    let result = validation.checkEmptyAndValidPasswordValidation(password: "")

    /// ASSERT
    XCTAssertFalse(result.isEmpty)
    XCTAssertNotNil(result)
    XCTAssertEqual(result, kMSG_PLEASE_ENTER_PASSWORD)
  }

  func test_LoginValidPassword_Validation_Returns_ValidationFailure() {
    /// ARRAGE
    let validation = Validation()

    /// ACT
    let result = validation.checkEmptyAndValidPasswordValidation(password: "123")

    /// ASSERT
    XCTAssertFalse(result.isEmpty)
    XCTAssertNotNil(result)
    XCTAssertEqual(result, kMSG_PLEASE_ENTER_VALID_PASSWORD)
  }

  func test_LoginPassword_Validation_With_Returns_ValidationSuccess() {
    /// ARRAGE
    let validation = Validation()

    /// ACT
    let result = validation.checkEmptyAndValidPasswordValidation(password: "Radixweb8")

    /// ASSERT
    XCTAssertTrue(result.isEmpty)
    XCTAssertEqual(result, "")
  }
}
