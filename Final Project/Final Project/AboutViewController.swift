//
//  AboutViewController.swift
//  Final Project
//
//  Created by Jeffrey Friel on 7/28/17.
//  Copyright © 2017 Jeffrey Friel. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    
    @IBOutlet weak var descriptionTextView: UITextView!
        override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Final Project Information"
       
        // Do any additional setup after loading the view.
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
