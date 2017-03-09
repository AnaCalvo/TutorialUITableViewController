//
//  FruitsTableViewController.swift
//  TableExample
//
//  Created by Ana Calvo on 9/3/17.
//  Copyright © 2017 Ana Calvo. All rights reserved.
//

import UIKit

class FruitsTableViewController: UITableViewController {

        // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

       cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }

}
