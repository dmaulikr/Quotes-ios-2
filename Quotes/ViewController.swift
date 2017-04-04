//
//  ViewController.swift
//  Quotes
//
//  Created by Alex Perez Colmenares on 12/27/16.
//  Copyright © 2016 Alex Perez Colmenares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textCategorie: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func addCategorie(_ sender: Any) {
        if textCategorie.text != ""
        {
            let  tempArrayQuotes = [[String: String]]()
            let tempCategorieQuote = Categorie(categorieName: textCategorie.text!, arrayQuotes: tempArrayQuotes)
            categoriesQuotes.append(tempCategorieQuote)
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: categoriesQuotes)
            userDefaults.set(encodedData, forKey: "CategoriesQUOTES")
            userDefaults.synchronize()
            textCategorie.text=""
        }
        else
        {
            let alert = UIAlertController(title: "Alert", message: "You can't leave empty textfields", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

