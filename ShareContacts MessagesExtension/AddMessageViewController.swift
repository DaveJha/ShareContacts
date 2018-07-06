//
//  AddMessageViewController.swift
//  ShareContacts MessagesExtension
//
//  Created by Dave Jha on 6/12/18.
//  Copyright © 2018 Dave Jha. All rights reserved.
//

import UIKit

protocol AddMessageViewControllerDelegate {
    func addMessageViewControllerDidSubmit(image: UIImage, caption:String)
}

class AddMessageViewController: UIViewController {
    
    var delegate: AddMessageViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ShareContacts(_ sender: Any) {
        let img = UIImage(named: "testImg.jpg")
        let caption = "Tap to share contacts"
        self.delegate.addMessageViewControllerDidSubmit(image: img!, caption: caption)
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
