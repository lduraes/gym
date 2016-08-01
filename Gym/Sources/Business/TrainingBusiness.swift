//
//  TrainingBusiness.swift
//  Gym
//
//  Created by Luiz Duraes on 7/28/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import Foundation

typealias TrainingClosure = (() throws -> [Training]) -> Void

struct TrainingBusiness {
    //MARK: - Properties
    var provider: TrainingProviderProtocol = TrainingProvider()
    
    //MARK: - Public Methods
    func getTrain(type type:String, completion: TrainingClosure) {
        do {
            let result = try provider.getTrain(type: type)
            let items = try parse(with: result)
            
            completion { items }
        } catch {
            completion { throw error }
        }
        
    }
    
    //MARK: - Private Methods
    private func parse(with dictionaries: [TrainingType]) throws -> [Training] {
        var items: [Training] = []
        
        for dictionary in dictionaries {
            let item = try Training(dictionary: dictionary)
            items.append(item)
        }
        
        return items
    }
}