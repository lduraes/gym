//
//  TrainingErrorType.swift
//  Gym
//
//  Created by Luiz Duraes on 7/28/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import UIKit

enum TrainingErrorType: ErrorType {
    case notFound
    case invalidUrl
    case unexpected
    case parse(String)
}