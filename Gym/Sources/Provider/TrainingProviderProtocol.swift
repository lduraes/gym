//
//  TrainingProviderProtocol.swift
//  Gym
//
//  Created by Luiz Duraes on 7/28/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import Foundation

protocol TrainingProviderProtocol {
    /**
     Returns an array of training objects.
     
     - parameter type: Training type
     
     - throws: throw an error
     
     - returns: callback
     */
    func getTrain(type type:String) throws -> [TrainingType]
}