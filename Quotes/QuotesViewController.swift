//
//  QuotesViewController.swift
//  Quotes
//
//  Created by Alex Perez Colmenares on 12/28/16.
//  Copyright © 2016 Alex Perez Colmenares. All rights reserved.
//

import UIKit
var activeQuote = -1
class QuotesViewController: UITableViewController {
     
    @IBOutlet var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewDidAppear(_ animated: Bool) {
        table.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoriesQuotes[activePlace].arrayQuotes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = categoriesQuotes[activePlace].arrayQuotes[indexPath.row]["quote"]
        cell.textLabel?.font = UIFont(name:"Cochin-Italic", size:22)
        //cell.textLabel?.textColor = UIColor(cgColor: CGColor)
        // Configure the cell...
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activeQuote = indexPath.row
        performSegue(withIdentifier: "toQuote", sender: nil)
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            categoriesQuotes[activePlace].arrayQuotes.remove(at: indexPath.row)
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: categoriesQuotes)
            userDefaults.set(encodedData, forKey: "CategoriesQUOTES")
            userDefaults.synchronize()
            table.reloadData()
        }
    }

    

}
