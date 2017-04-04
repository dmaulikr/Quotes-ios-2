//
//  AddQuoteViewController.swift
//  Quotes
//
//  Created by Alex Perez Colmenares on 12/28/16.
//  Copyright © 2016 Alex Perez Colmenares. All rights reserved.
//

import UIKit

class AddQuoteViewController: ViewController {

    @IBOutlet var quoteTextField: UITextField!
    
    @IBOutlet var authorTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addQuote(_ sender: Any) {
        if quoteTextField.text != "" && authorTextField.text != ""
        {
            let  tempArrayQuotes: [String: String] = ["quote":quoteTextField.text!,"author": authorTextField.text!]
            categoriesQuotes[activePlace].arrayQuotes.append(tempArrayQuotes)
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: categoriesQuotes)
            userDefaults.set(encodedData, forKey: "CategoriesQUOTES")
            userDefaults.synchronize()
            quoteTextField.text=""
            authorTextField.text=""
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
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
