//
//  LoginPracticeTests.swift
//  LoginPracticeTests
//
//  Created by Hari Krishna Bista on 7/3/23.
//

import XCTest
@testable import SearchPlaces

final class LoginViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // When username and password invalid, submit is disabled
    func testIsFormValid() throws {
        
        let validator = LoginValidator()
        
        var repository: LoginRepositoryProcotol = LoginRepository(
            network: NetworkService(),
            local: LocalStorage()
        )
        
        let loginViewModel = LoginViewModel(
            validator: validator,
            repository: repository
        )
        
        loginViewModel.userName = "jsmith@fiskerinc.com"
        loginViewModel.password = "Test@1234"
        
        let expectation = self.expectation(description: "login completion handler invoked")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            XCTAssert(loginViewModel.isFormValid == true)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
    func testLoginFailureValid() throws {
        
        let loginViewModel = LoginViewModel(
            validator: LoginValidator(),
            repository: MockLoginFailureRepository(networkService: NetworkService())
        )
        
        loginViewModel.userName = "jsmith@fiskerinc.com"
        loginViewModel.password = "Test@1234"
        
        let expectation = self.expectation(description: "login completion handler invoked")
        
        loginViewModel.onSubmit()
        
        DispatchQueue.main.async {
            XCTAssertFalse(loginViewModel.isLoginSuccess,"isLoginSuccess should be false")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
    func testLoginSuccessValid() throws {
        
        let loginViewModel = LoginViewModel(
            validator: LoginValidator(),
            repository: MockLoginSuccessRepository(networkService: NetworkService())
        )
        
        loginViewModel.userName = "jsmith@fiskerinc.com"
        loginViewModel.password = "Test@1234"
        
        let expectation = self.expectation(description: "login completion handler invoked")
        
        loginViewModel.onSubmit()
        
        DispatchQueue.main.async {
            XCTAssertTrue(loginViewModel.isLoginSuccess,"isLoginSuccess should be false")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
}

class MockLoginFailureRepository : LoginRepositoryProcotol {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func login(
        userName: String,
        password: String,
        completion: @escaping (Bool, String?) -> Void
    ) {
        completion(false, "Login failed.")
    }
}

class MockLoginSuccessRepository : LoginRepositoryProcotol {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func login(
        userName: String,
        password: String,
        completion: @escaping (Bool, String?) -> Void
    ) {
        completion(true, "Login succesful.")
    }
}
