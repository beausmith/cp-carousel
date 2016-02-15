//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Beau Smith on 2/14/16.
//  Copyright © 2016 Beau Smith. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageView.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapSignOut(sender: AnyObject) {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .ActionSheet)

        // create a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)

        // create an OK action
        let OKAction = UIAlertAction(title: "Sign Out", style: .Destructive) { (action) in
            self.performSegueWithIdentifier("logoutSegue", sender: self)
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)

        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
    }
    
    @IBAction func didClose(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
