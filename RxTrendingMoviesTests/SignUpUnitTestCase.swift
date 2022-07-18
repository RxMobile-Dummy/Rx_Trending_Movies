//
//  SignUpUnitTestCase.swift
//  RxTrendingMoviesTests
//
//  Created by Devangi Prajapati on 07/07/22.
//

import XCTest
@testable import RxTrendingMovies

class SignUpUnitTestCase: XCTestCase {
    func test_SignUpEmailValidation_With_EmptyString_Returns_ValidationFailure() {

      /// ARRANGE
      let validation = Validation()

      /// ACT
      let result = validation.checkEmptyAndValidEmailValidation(email: "")

      /// ASSERT
      XCTAssertFalse(result.isEmpty)
      XCTAssertNotNil(result)
      XCTAssertEqual(result, kMSG_PLEASE_ENTER_EMAIL)
    }

    func test_SignUpValidEmail_Validation_Returns_ValidationFailure() {

      /// ARRANGE
      let validation = Validation()

      /// ACT
      let result = validation.checkEmptyAndValidEmailValidation(email: "test")

      /// ASSERT
      XCTAssertFalse(result.isEmpty)
      XCTAssertNotNil(result)
      XCTAssertEqual(result, kMSG_PLEASE_ENTER_VALID_EMAIL)
    }

    func test_SignUpEmail_Validation_With_Returns_ValidationSuccess() {

      /// ARRANGE
      let validation = Validation()

      /// ACT
      let result = validation.checkEmptyAndValidEmailValidation(email: "devangi.prajapati@radixweb.com")

      /// ASSERT
      XCTAssertTrue(result.isEmpty)
      XCTAssertEqual(result, "")
    }

    func test_SignUpPassword_Validation_With_EmptyStrin_Returns_ValidationFailure() {
      /// ARRANGE
      let validation = Validation()

      /// ACT
      let result = validation.checkEmptyAndValidPasswordValidation(password: "")

      /// ASSERT
      XCTAssertFalse(result.isEmpty)
      XCTAssertNotNil(result)
      XCTAssertEqual(result, kMSG_PLEASE_ENTER_PASSWORD)
    }

    func test_SignUpValidPassword_Validation_Returns_ValidationFailure() {
      /// ARRANGE
      let validation = Validation()

      /// ACT
      let result = validation.checkEmptyAndValidPasswordValidation(password: "123")

      /// ASSERT
      XCTAssertFalse(result.isEmpty)
      XCTAssertNotNil(result)
      XCTAssertEqual(result, kMSG_PLEASE_ENTER_VALID_PASSWORD)
    }

    func test_SignUpPassword_Validation_With_Returns_ValidationSuccess() {
      /// ARRANGE
      let validation = Validation()

      /// ACT
      let result = validation.checkEmptyAndValidPasswordValidation(password: "Radixweb8")

      /// ASSERT
      XCTAssertTrue(result.isEmpty)
      XCTAssertEqual(result, "")
    }
    
    func test_SignUpConfirmPassword_Validation_With_EmptyStrin_Returns_ValidationFailure() {
      /// ARRANGE
      let validation = Validation()

      /// ACT
        let result = validation.checkEmptyAndValidConfirmPasswordValidation(confirmPassword: "", password: "Radixweb8")

      /// ASSERT
      XCTAssertFalse(result.isEmpty)
      XCTAssertNotNil(result)
      XCTAssertEqual(result, kMSG_PLEASE_ENTER_CONFRIM_PASSWORD)
    }

    func test_SignUpValidConfirmPassword_Validation_Returns_ValidationFailure() {
      /// ARRANGE
      let validation = Validation()

      /// ACT
        let result = validation.checkEmptyAndValidConfirmPasswordValidation(confirmPassword: "123", password: "Radixweb8")

      /// ASSERT
      XCTAssertFalse(result.isEmpty)
      XCTAssertNotNil(result)
      XCTAssertEqual(result, kMSG_PLEASE_ENTER_VALID_CONFIRM_PASSWORD)
    }
    
    func test_SignUpValidMatchConfirmPassword_Validation_Returns_ValidationFailure() {
      /// ARRANGE
      let validation = Validation()

      /// ACT
        let result = validation.checkEmptyAndValidConfirmPasswordValidation(confirmPassword: "Radixweb18", password: "Radixweb8")

      /// ASSERT
      XCTAssertFalse(result.isEmpty)
      XCTAssertNotNil(result)
      XCTAssertEqual(result, kMSG_PASSWORD_CONFIRMPASSWORD_DO_NOT_MATCH)
    }

    func test_SignUpConfirmPassword_Validation_With_Returns_ValidationSuccess() {
      /// ARRANGE
      let validation = Validation()

      /// ACT
        let result = validation.checkEmptyAndValidConfirmPasswordValidation(confirmPassword: "Radixweb8", password: "Radixweb8")

      /// ASSERT
      XCTAssertTrue(result.isEmpty)
      XCTAssertEqual(result, "")
    }
}
