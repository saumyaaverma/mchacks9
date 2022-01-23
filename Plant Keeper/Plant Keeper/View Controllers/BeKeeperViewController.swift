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

    }
    @IBAction func addButtonTapped(_ sender: Any) {
        
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
                        "isAvailable": isAvailable,
                    ])
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
