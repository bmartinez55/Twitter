//
//  TweetViewController.swift
//  Twitter
//
//  Created by Brian Martinez on 2/18/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        textTweetView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var textTweetView: UITextView!
    
    @IBAction func tweetButton(_ sender: Any) {
        if(!textTweetView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: textTweetView.text, success: {
                self.dismiss(animated: true, completion: nil)
            },failure: {(error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }else{
            self.dismiss(animated: true, completion: nil)
        }
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
