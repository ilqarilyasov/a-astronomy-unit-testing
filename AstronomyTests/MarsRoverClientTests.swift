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
    
    func testFetchMarsRover() {
        let mockLoader = MockLoader(data: validRoverJSON, error: nil)
        let client = MarsRoverClient(networkDataLoader: mockLoader)
        
        let expectation = self.expectation(description: "Rover should have a value.")
        client.fetchMarsRover(named: "Curiosity") { (rover, error) in
            defer { expectation.fulfill() }
            XCTAssertNotNil(rover)
            XCTAssertNil(error)
        }
        
        waitForExpectations(timeout: 5) { (error) in
            if let error = error {
                NSLog("Error waiting for expectation: \(error)")
            }
        }
    }
    
    func testFetchPhotos() {
        let mockLoader = MockLoader(data: validSol1JSON, error: nil)
        let client = MarsRoverClient(networkDataLoader: mockLoader)
        
        let decoder = MarsPhotoReference.jsonDecoder
        let roverDict = try! decoder.decode([String: MarsRover].self, from: validRoverJSON)
        let rover = roverDict["photoManifest"]!
        
        let expectation = self.expectation(description: "Rover should have a value.")
        client.fetchPhotos(from: rover, onSol: 1) { (photoRef, error) in
            defer { expectation.fulfill() }
            XCTAssertNotNil(photoRef)
            XCTAssertNil(error)
        }
        
        self.waitForExpectations(timeout: 15) { (error) in
            if let error = error {
                NSLog("Error waiting for expectation: \(error)")
            }
        }
    }
    
    func testFetchPhotoOperation() {
        
    }

}
