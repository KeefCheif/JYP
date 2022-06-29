//
//  APIManagerTests.swift
//  JYPTests
//
//  Created by peter allgeier on 6/28/22.
//

import XCTest
@testable import JYP

class APIManagerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // NA
    }
    
    func testBusinessSearchRequest() throws {
        
        let apiManager: APIManager = APIManager()
        
        let getExpectation = XCTestExpectation(description: "GET")

        let denverLocation: Locations = .Denver
        apiManager.getBusinesses(latitude: denverLocation.lat, longitude: denverLocation.long) { (model, error) in
            
            XCTAssertNil(error)
            XCTAssertNotNil(model)
            XCTAssertGreaterThan(model!.total!, 10)
            
            getExpectation.fulfill()
        }
        
        wait(for: [getExpectation], timeout: 20)
    }
    
    func testBusinessReviewRequest() throws {
        
        let apiManager: APIManager = APIManager()
        
        let getExpectation = XCTestExpectation(description: "GET")
        
        apiManager.getBusinessReview(id: "lJAGnYzku5zSaLnQ_T6_GQ") { (model, error) in
            
            XCTAssertNil(error)
            XCTAssertNotNil(model)
            XCTAssertGreaterThan(model!.reviews.count, 1)
            
            getExpectation.fulfill()
        }
        
        wait(for: [getExpectation], timeout: 20)
    }
}

