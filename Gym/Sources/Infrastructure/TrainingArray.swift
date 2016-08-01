//
//  TrainingArray.swift
//  Gym
//
//  Created by Luiz Duraes on 7/29/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import UIKit

extension Array {
    func at(index: Int) -> Element? {
        if indices.contains(index) {
            return self[index]
        }
        
        return nil
    }
}