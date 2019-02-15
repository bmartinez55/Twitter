//
//  loginViewController.swift
//  Twitter
//
//  Created by Brian Martinez on 2/12/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userloggedin") == true{
            self.performSegue(withIdentifier: "logintohome", sender: self)
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let myURL = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myURL, success: {
            UserDefaults.standard.set(true, forKey: "userloggedin")
            self.performSegue(withIdentifier: "logintohome", sender: self)
        }, failure: { (Error) in
            print("Could not login")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
