//
//  QuoteViewController.swift
//  Quotes
//
//  Created by Alex Perez Colmenares on 12/28/16.
//  Copyright © 2016 Alex Perez Colmenares. All rights reserved.
//

import UIKit

class QuoteViewController: ViewController {

    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        quoteLabel.text = categoriesQuotes[activePlace].arrayQuotes[activeQuote]["quote"]
        authorLabel.text = categoriesQuotes[activePlace].arrayQuotes[activeQuote]["author"]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
