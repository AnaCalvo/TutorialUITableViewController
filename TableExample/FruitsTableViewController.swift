//
//  FruitsTableViewController.swift
//  TableExample
//
//  Created by Ana Calvo on 9/3/17.
//  Copyright © 2017 Ana Calvo. All rights reserved.
//

import UIKit

class FruitTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var fruitImageView: UIImageView!
}

class FruitsTableViewController: UITableViewController {
    
    var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                  "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                  "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                  "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                  "Pear", "Pineapple", "Raspberry", "Strawberry"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

        // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! FruitTableViewCell
        
        let fruitName = fruits[indexPath.row]
        cell.label?.text = fruitName
        cell.fruitImageView?.image = UIImage(named: fruitName)

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.fruits[sourceIndexPath.row]
        fruits.remove(at: sourceIndexPath.row)
        fruits.insert(movedObject, at: destinationIndexPath.row)
        NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.row) \(fruits)")
        // To check for correctness enable: self.tableView.reloadData()
    }
    
    //Enables the reorder control only for A rows
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        let rowData = fruits[indexPath.row]
        return rowData.hasPrefix("A")
    }

}
