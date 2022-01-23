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
        db.collection("users").whereField("isAvailable", isEqualTo: true)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                let cities = documents.map { $0["firstname"]! }
                print("names: \(cities)")
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
