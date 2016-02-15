//
//  LoginViewController.swift
//  Carousel
//
//  Created by Beau Smith on 2/13/16.
//  Copyright © 2016 Beau Smith. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        scrollView.delegate = self
        
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100 // 112
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -158
    }
    
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.5) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        print("keyboardWillShow")
        
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        
        // Scroll the scrollview up
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY
    }

    
    
    @IBAction func didLogin(sender: AnyObject) {
        let alertController = UIAlertController(title: "Email and Password Required", message: "fix it!", preferredStyle: .Alert)
        
        // create a cancel action
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        
        activityIndicator.startAnimating()

        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            self.activityIndicator.stopAnimating()
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        } else {
            delay(2, closure: { () -> () in
                if self.emailField.text == "asdf" || self.passwordField.text == "asdf" {
                    self.performSegueWithIdentifier("loginSegue", sender: self)
                } else {
                    self.activityIndicator.stopAnimating()
                    self.presentViewController(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }

                }
            })
        }
    }
    
    @IBAction func didBack(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    // The scrollView is in the proccess of scrolling...
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
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
