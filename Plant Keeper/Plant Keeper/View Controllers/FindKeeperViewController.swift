//
//  FindKeeperViewController.swift
//  Plant Keeper
//
//  Created by Aria Rens on 1/22/22.
//

import UIKit
import Firebase
import FirebaseFirestore

class FindKeeperViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let db = Firestore.firestore()
        var ref = Firebase(url:MY_FIREBASE_URL)
        ref.observeSingleEvent(of: .value) { snapshot in
            for case let child as FIRDataSnapshot in snapshot.children {
                guard let dict = child.value as? [String:Any] else {
                    print("Error")
                    return
                }
                let country = dict["country"] as Any
                let city = dict["city"] as Any
                print(longtitude)
                print(latitude)
            }
        }

        
        
        // Do any additional setup after loading the view.
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
