//
//  TrainingTableViewCell.swift
//  Gym
//
//  Created by Luiz Duraes on 7/28/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import UIKit

class TrainingTableViewCell: UITableViewCell {
    //MARK: - Constants
    private let kWeight = " Kg"
    
    //MARK: - Outlets
    @IBOutlet private weak var repetitionLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    
    //MARK: - Properties
    private var item: Training?
    
    //MARK: - Public Methods
    func fullfill(with item: Training) {
        self.item = item
        self.repetitionLabel.text = String(item.repetition)
        self.nameLabel.text = item.name
        self.weightLabel.text = String(item.weight) + kWeight
    }
}