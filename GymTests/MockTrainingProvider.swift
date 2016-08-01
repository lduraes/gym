//
//  MockTrainingProvider.swift
//  Gym
//
//  Created by Luiz Duraes on 7/30/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

@testable import Gym

struct MockTrainingProvider: TrainingProviderProtocol {
    let trainingList: [TrainingType] = [
        ["Repetition": 15
        ,"Name": "Cadeira Extensora"
        ,"Weight": 25
        ,"Done": false]
    ]
    
    func getTrain(type type: String) throws -> [TrainingType] {
        return trainingList
    }
}