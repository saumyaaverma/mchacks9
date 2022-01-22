//
//  ViewController.swift
//  Plant Keeper
//
//  Created by Aria Rens on 1/21/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpElements()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "back")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        var view = UILabel()

        view.frame = CGRect(x: 0, y: 0, width: 411, height: 418)

        


        view.textColor = UIColor(red: 1, green: 0.988, blue: 0.988, alpha: 1)


        view.numberOfLines = 2

        view.lineBreakMode = .byWordWrapping


        // Line height: 120 pt


        view.text = "Plant\nKeeper."


        var parent = self.view!

        parent.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false

        view.widthAnchor.constraint(equalToConstant: 411).isActive = true

        view.heightAnchor.constraint(equalToConstant: 418).isActive = true

        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 10).isActive = true

        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 197).isActive = true
        
    }

    func setUpElements() {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleFilledButton(loginButton)
        
    }
    
    


}

