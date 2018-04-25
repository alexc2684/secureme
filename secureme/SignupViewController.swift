//
//  SignupViewController.swift
//  secureme
//
//  Created by Alex Chan on 4/25/18.
//  Copyright © 2018 secure.me. All rights reserved.
//

import UIKit
import CoreData

class SignupViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
//    var newUser
    
    @IBAction func submit(_ sender: Any) {
        if username.text != "" && password.text != "" {
//            newUser.setValue(username.text, forKey: "username")
//            newUser.setValue(password.text, forKey: "password")
//            newUser.setValue(email.text, forKey: "email")
//            newUser.setValue(phone.text, forKey: "phone")



            performSegue(withIdentifier: "userinfosegue", sender: self)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! NewsSelectionTableViewController
        
        //store these as core data
        secondController.username = username.text!
        secondController.password = password.text!
        secondController.email = email.text!
        secondController.phone = phone.text!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.username.delegate = self
        self.password.delegate = self
        
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
