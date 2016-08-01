//
//  TrainingViewController.swift
//  Gym
//
//  Created by Luiz Duraes on 7/28/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import UIKit

class TrainingViewController: UIViewController {
    //MARK: - Constants
    private let kTrainingA = "A"
    private let kTrainingB = "B"
    
    //MARK: - Properties
    var items: [Training] = []
    var trainingType: String?
    
    //MARK: - Computed properties
    private var mainView: TrainingView {
        return self.view as! TrainingView
    }
    
    //MARK: - Overrides
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        trainingType = kTrainingA
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - Actions
    @IBAction func didSelectTraining(sender: UISegmentedControl) {
        trainingType = sender.selectedSegmentIndex == 0 ? kTrainingA : kTrainingB
        mainView.unselectAllTableViewRows()
        loadItems()
    }
    
    //MARK: - Private Methods
    private func configUI() {
        mainView.prepareTableView()
        loadItems()
    }
    
    private func loadItems() {
        guard let training = trainingType else { return }
        
        TrainingBusiness().getTrain(type: training) { [weak self] (result) in
            do {
                guard let `self` = self else { return }
                let items = try result()
                self.items = items
                self.mainView.reloadTableView()
            } catch {
                print("[ERROR] Loading training items into UITableView")
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension TrainingViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let training = items.at(indexPath.row) else { return UITableViewCell() }
        let cell = mainView.reusableTableViewCell()
        cell.fullfill(with: training)
        
        return cell
    }
}

extension TrainingViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let cell = tableView.cellForRowAtIndexPath(indexPath) else { return }
        cell.accessoryType = cell.accessoryType == .None ? .Checkmark : .None
    }
}