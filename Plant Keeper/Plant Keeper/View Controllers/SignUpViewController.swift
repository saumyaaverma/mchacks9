//
//  SignUpViewController.swift
//  Plant Keeper
//
//  Created by Aria Rens on 1/21/22.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        //error label
        errorLabel.alpha = 0
        
        //set up elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    
    //check the fields and vslidate that the data is correct
    //if everything is correct return nil
    //else return error message
    func validateFields() -> String?{
        //check all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        //check if the password is secured
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in:
                .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false{
            return "Please make sure password is at least 8 characters, contains special character and a number"
        }
        return nil
    }
    @IBAction func signUpTapped(_ sender: Any) {
        
        //validate fields
        let error = validateFields()
        
        if error != nil {
            //there is something wrong with the fields, show error message
            //potential error
            showError(message: error!)
        }
        
        else{
            Auth.auth().createUser(withEmail: "", password: "") { result, err in
                //create user
                if err != nil {
                    self.showError(message: "Error creating user")
                }
                else{
                }
            }
            }
        
        //transition to the home screen
    }
    
    
    func showError(message:String){
        errorLabel.text = message
        errorLabel.alpha=1
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
