//
//  TrainingProvider.swift
//  Gym
//
//  Created by Luiz Duraes on 7/28/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import Foundation

typealias TrainingType = [String: AnyObject]
typealias TrainingProviderClosure = (() throws -> [TrainingType]) -> Void

struct TrainingProvider {
    //MARK: - Constants
    private let kTrainingAKey = "TrainingList"
    private let kTrainingFile = "Training"
    private let kTrainingExtension = "plist"
}

//MARK: - TrainingProviderProtocol
extension TrainingProvider: TrainingProviderProtocol {
    func getTrain(type type:String) throws -> [TrainingType] {
        guard let filePath = NSBundle.mainBundle().pathForResource(kTrainingFile + type, ofType: kTrainingExtension) else { throw TrainingErrorType.parse("[ERROR] Training\(type).plist file not found") }
        guard let items = NSDictionary(contentsOfFile: filePath) else { throw TrainingErrorType.parse("[ERROR] Loading Training\(type).plist items") }
        guard let dictionaries = items.objectForKey(kTrainingAKey) as? [TrainingType] else { throw TrainingErrorType.parse("[ERROR] Parsing Training\(type).plist file") }
        
        return dictionaries
    }
}