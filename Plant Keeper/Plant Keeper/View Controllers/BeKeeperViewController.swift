//
//  KeeperViewController.swift
//  Plant Keeper
//
//  Created by Aria Rens on 1/22/22.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class BeKeeperViewController: UIViewController {
    
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var postalCodeField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "back")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

        // Do any additional setup after loading the view.
    }
    

    func setUpElements() {
        
        //style the elements
        Utilities.styleTextField(countryTextField)
        Utilities.styleTextField(cityTextField)
        Utilities.styleTextField(postalCodeField)
        Utilities.styleTextField(addressTextField)
        Utilities.styleFilledButton(addButton)
        addLabel.alpha = 0

    }
    @IBAction func addButtonTapped(_ sender: Any) {
        
        //validate fields
        let error = validateFields()
        
        if error != nil {
            //there is something wrong with the fields, show error message
            //potential error
            showError(message: error!)
        }
        
        else {
            let country = countryTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let city = cityTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let postalCode = postalCodeField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let address = addressTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let isAvailable = true
            let db = Firestore.firestore()
            let user = Auth.auth().currentUser
            db.collection("users").whereField("uid", isEqualTo: user?.uid).getDocuments() { (querySnapshot, err) in
                        let document = querySnapshot!.documents.first
                        document?.reference.updateData([
                            "country": country,
                            "city": city,
                            "postalCode": postalCode,
                            "address": address,
                            "isAvailable": isAvailable
                        ])
                }
            showDone()
        }
        
        
    }
    
    func showError(message:String){
        addLabel.text = message
        addLabel.alpha = 1
    }
    
    func showDone() {
        addLabel.text = "Thank you for signing up to be a plant keeper!  You will be contacted by potential matches in your area."
        addLabel.alpha = 1
    }
    
    //check the fields and vslidate that the data is correct
    //if everything is correct return nil
    //else return error message
    func validateFields() -> String?{
        //check all fields are filled in
        if countryTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            cityTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            postalCodeField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            addressTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        return nil
    }

}
