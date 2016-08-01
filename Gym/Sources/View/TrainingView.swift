//
//  TrainingView.swift
//  Gym
//
//  Created by Luiz Duraes on 7/28/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import UIKit

class TrainingView: UIView {
    //MARK: - Constants
    private let kCellIdentifier = "trainingCell"
    
    //MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
   
    //MARK: - Public Methods
    func prepareTableView() {
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func reusableTableViewCell() -> TrainingTableViewCell {
        let cell: TrainingTableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as! TrainingTableViewCell
        
        return cell
    }
    
    func unselectAllTableViewRows() {
        guard let tableView = self.tableView else { return }
        
        for cell in tableView.visibleCells {
            cell.accessoryType = .None
        }
    }
}