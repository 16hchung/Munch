//
//  FoodPreferencesViewController.swift
//  Munch
//
//  Created by Heejung Chung on 11/3/17.
//  Copyright © 2017 hjchung. All rights reserved.
//

import UIKit

class FoodPreferencesViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    let optionsInSections = [FoodPreference.allOnCampusPreferences(), FoodPreference.allOffCampusPreferences()]
    var foodPreferences = Set<FoodPreference>()
    
    // MARK: VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // configure tableView
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case Constants.Segues.FOOD_TO_BUDGET:
            guard let budgetVC = segue.destination as? BudgetViewController else { return }
            if let currentUser = User.current {
                currentUser.foodPreferences = foodPreferences
            } else {
                budgetVC.foodPreferences = foodPreferences
            }
            break
        default:
            break
        }
    }
    
    // MARK: - Private Helpers
    
    private func option(forIndexPath indexPath: IndexPath) -> FoodPreference? {
        if indexPath.section >= optionsInSections.count { return nil }
        let optionsForSection = optionsInSections[indexPath.section]
        if indexPath.row >= optionsForSection.count { return nil }
        
        return optionsForSection[indexPath.row]
    }
    
}

extension FoodPreferencesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return Constants.FoodPreferences.TABLEVIEW_ON_CAMPUS_HEADER
        case 1:
            return Constants.FoodPreferences.TABLEVIEW_OFF_CAMPUS_HEADER
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < optionsInSections.count {
            return optionsInSections[section].count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.FoodPreferences.TABLEVIEW_CELL_ID, for: indexPath)
        
        cell.textLabel?.text = option(forIndexPath: indexPath)?.rawValue.replacingOccurrences(of: "_", with: " ")
        
        return cell
    }
    
}

extension FoodPreferencesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath),
              let option = option(forIndexPath: indexPath) else {
            return 
        }
        switch cell.accessoryType {
        case .checkmark:
            cell.accessoryType = .none
            foodPreferences.remove(option)
            break
        case .none:
            cell.accessoryType = .checkmark
            foodPreferences.insert(option)
            break
        default:
            break
        }
    }
}
