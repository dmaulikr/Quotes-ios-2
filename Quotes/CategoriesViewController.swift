//
//  CategoriesViewController.swift
//  Quotes
//
//  Created by Alex Perez Colmenares on 12/27/16.
//  Copyright © 2016 Alex Perez Colmenares. All rights reserved.
//

import UIKit
class Categorie: NSObject, NSCoding {
    var categorieName: String
    var arrayQuotes =  [[String: String]]()
    init(categorieName: String, arrayQuotes: [[String: String]]) {
        self.categorieName = categorieName
        self.arrayQuotes = arrayQuotes
    }
    required convenience init(coder aDecoder: NSCoder) {
        let categorieName = aDecoder.decodeObject(forKey: "CategorieNAME") as! String
        let arrayQuotes = aDecoder.decodeObject(forKey: "ArrayQUOTES") as! [[String: String]]
        self.init(categorieName: categorieName, arrayQuotes: arrayQuotes)
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(categorieName, forKey: "CategorieNAME")
        aCoder.encode(arrayQuotes, forKey: "ArrayQUOTES")
    }
    
}
var categoriesQuotes: [Categorie] = []
var activePlace = -1
var userDefaults = UserDefaults.standard
class CategoriesViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let tempDecoded  = userDefaults.object(forKey: "CategoriesQUOTES") as? Data
        {
            let decoded = tempDecoded
            if let decodedCategoriesQuotes = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [Categorie]
            {
                categoriesQuotes = decodedCategoriesQuotes
            }
        }
        if categoriesQuotes.count == 0
        {
            var  tempArrayQuotes = [[String: String]]()
            tempArrayQuotes.append(["quote":"Love is the one thing were capable of perceiving that transcends dimensions of time and space.","author": "Brand"])
        
            let tempCategorieQuote = Categorie(categorieName: "Movies", arrayQuotes: tempArrayQuotes)
            categoriesQuotes.append(tempCategorieQuote)
            
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: categoriesQuotes)
            userDefaults.set(encodedData, forKey: "CategoriesQUOTES")
            userDefaults.synchronize()
        }
        table.reloadData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoriesQuotes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = categoriesQuotes[indexPath.row].categorieName
        cell.textLabel?.font = UIFont(name:"Cochin-Italic", size:27)
        // Configure the cell...
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activePlace = indexPath.row
        performSegue(withIdentifier: "toCategorie", sender: nil)
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            categoriesQuotes.remove(at: indexPath.row)
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: categoriesQuotes)
            userDefaults.set(encodedData, forKey: "CategoriesQUOTES")
            userDefaults.synchronize()
            table.reloadData()
        }
    }

}
