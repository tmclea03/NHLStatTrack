//
//  NHLStatTrackTests.swift
//  NHLStatTrackTests
//
//  Created by Tyler McLean on 2018-03-22.
//  Copyright © 2018 UofG Students. All rights reserved.
//

import XCTest
@testable import NHLStatTrack

class NHLStatTrackTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        APIGlue().getTeam(from: 24)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
