//
//  MarsRoverClientTests.swift
//  AstronomyTests
//
//  Created by Ilgar Ilyasov on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class MarsRoverClientTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchMarsRover() {
        let expectation = self.expectation(description: "Rover should have a value.")
        let mockLoader = MockLoader(data: validRoverJSON, error: nil)
        let client = MarsRoverClient(networkDataLoader: mockLoader)
        
        client.fetchMarsRover(named: "Curiosity", using: mockLoader) { (rover, error) in
            XCTAssertNotNil(rover)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5) { (error) in
            if let error = error {
                NSLog("Error waiting for expectation: \(error)")
            }
        }
    }
    
    func testFetchPhotos() {
        
    }

}
