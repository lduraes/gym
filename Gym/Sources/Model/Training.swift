//
//  Training.swift
//  Gym
//
//  Created by Luiz Duraes on 7/28/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import Foundation

struct Training {
    //MARK: - Constants
    private let kRepetition = "Repetition"
    private let kName = "Name"
    private let kWeight = "Weight"
    private let kDone = "Done"

    //MARK: - Properties
    let repetition: Int
    let name: String
    let weight: Int
    let done: Bool
    
    //MARK: - Initializers
    /**
     Initialize a training object from dictionary.
     
     - parameter dictionary: Origin dictionary
     
     - throws: TrainingErrorType
     
     - returns: A training object
     */
    init(dictionary: TrainingType) throws {
        guard let repetition = dictionary[kRepetition] as? Int else { throw TrainingErrorType.parse(kRepetition) }
        guard let name = dictionary[kName] as? String else { throw TrainingErrorType.parse(kName) }
        guard let weight = dictionary[kWeight] as? Int else { throw TrainingErrorType.parse(kWeight) }
        guard let done = dictionary[kDone] as? Bool else { throw TrainingErrorType.parse(kDone) }
        
        self.repetition = repetition
        self.name = name
        self.weight = weight
        self.done = done
    }
}