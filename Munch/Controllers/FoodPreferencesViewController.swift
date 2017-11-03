//
//  FoodPreferencesViewController.swift
//  Munch
//
//  Created by Heejung Chung on 11/3/17.
//  Copyright © 2017 hjchung. All rights reserved.
//

import UIKit

class FoodPreferencesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let choicesInSections = [FoodPreference.allOnCampusPreferences(), FoodPreference.allOffCampusPreferences()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // configure tableView
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
        if section < choicesInSections.count {
            return choicesInSections[section].count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.FoodPreferences.TABLEVIEW_CELL_ID, for: indexPath)
        
        let choicesForSection = choicesInSections[indexPath.section]
        cell.textLabel?.text = choicesForSection[indexPath.row].rawValue.replacingOccurrences(of: "_", with: " ")
        
        return cell
    }
    
}

extension FoodPreferencesViewController: UITableViewDelegate {
    
}
