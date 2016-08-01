//
//  GymTests.swift
//  GymTests
//
//  Created by Luiz Duraes on 7/28/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import XCTest
@testable import Gym

class GymTests: XCTestCase {
    //MARK: - Properties
    var business = TrainingBusiness()
    var provider = MockTrainingProvider()
    
    override func setUp() {
        super.setUp()
        
        // inject mock provider
        business.provider = provider
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetTrainSuccessful() {
        business.getTrain(type: "A") { (result) in
            do {
                guard let trainResult: [Training] = try result() else { XCTFail("testGetTrainSuccessful() - No training items were found") }
                
                XCTAssert(trainResult.count == 1, "testGetTrainSuccessful() - Quantity of training items are incorrect")
                XCTAssertEqual(trainResult[0].repetition , 15, "testGetTrainSuccessful() - Repetition incorrect")
                XCTAssertEqual(trainResult[0].name , "Cadeira Extensora", "testGetTrainSuccessful() - Name incorrect")
                XCTAssertEqual(trainResult[0].weight , 25, "testGetTrainSuccessful() - Weight incorrect")
                XCTAssertEqual(trainResult[0].done , false, "testGetTrainSuccessful() - Status incorrect")
            } catch {
                XCTFail("testGetTrainSuccessful() - Retrieving training items from mock file")
            }
        }
    }
    
    func testeGetTrainError() {
        business.getTrain(type: "B") { (result) in
            do {
                guard let _: [Training] = try result() else { XCTAssertTrue(true) }
            } catch {
                XCTFail("testeGetTrainError() - Not occurred an error")
            }
        }
    }
}
