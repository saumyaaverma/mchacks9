//
//  HomeViewController.swift
//  Plant Keeper
//
//  Created by Aria Rens on 1/21/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)

                backgroundImage.image = UIImage(named: "back2")
                backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
                self.view.insertSubview(backgroundImage, at: 0)


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
