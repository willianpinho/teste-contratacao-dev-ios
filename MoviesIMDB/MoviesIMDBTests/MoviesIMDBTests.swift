//
//  MoviesIMDBTests.swift
//  MoviesIMDBTests
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import XCTest
@testable import MoviesIMDB

final class MoviesIMDBTests: XCTestCase {
    
    var webservice: MockWebService!
    var viewModel: MovieListViewModel!
    
    func testGetTop250Movies() {
        let expectation = XCTestExpectation(description: "Get top 250 movies")
        let webService = WebService()
        
        webService.getTop250Movies { (result) in
            switch result {
            case .success(let movies):
                XCTAssert(movies.count == 250, "Expected 250 movies")
            case .failure(let error):
                XCTFail("Failed to get top 250 movies: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testFetchMovies() {
        let expectation = XCTestExpectation(description: "Fetch movies")
        let webservice = WebService()
        let viewModel = MovieListViewModel(webservice: webservice)
        
        viewModel.dataFound = {
            XCTAssert(viewModel.movies.count == 250, "Expected 250 movies")
            expectation.fulfill()
        }
        
        viewModel.fetchMovies()
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    override func setUp() {
        super.setUp()
        webservice = MockWebService()
        viewModel = MovieListViewModel(webservice: webservice)
    }
    
    override func tearDown() {
        webservice = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testInitializeAuthentication() {
        let authService = AuthService.shared
        authService.initializeAuthentication()
        
        XCTAssertFalse(authService.userAuthenticated(), "User should not be authenticated after initialization")
    }
    
    func testAuthenticate() {
        let authService = AuthService.shared
        authService.authenticate(bool: true)
        
        XCTAssertTrue(authService.userAuthenticated(), "User should be authenticated after calling authenticate with true")
    }
    
    func testUserAuthenticated() {
        let authService = AuthService.shared
        authService.initializeAuthentication()
        
        XCTAssertFalse(authService.userAuthenticated(), "User should not be authenticated after initialization")
        
        authService.authenticate(bool: true)
        
        XCTAssertTrue(authService.userAuthenticated(), "User should be authenticated after calling authenticate with true")
    }
}

class MockWebService: WebService {
    var movies: [Movie]?
    
    override func getTop250Movies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        if let movies = movies {
            completion(.success(movies))
        } else {
            completion(.failure(NSError(domain: "MockWebService", code: 0, userInfo: nil)))
        }
    }
}
