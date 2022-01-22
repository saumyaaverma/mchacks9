import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        textfield.layer.cornerRadius = 25.0
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 255, green: 255, blue: 255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.setTitleColor(.black, for: .normal)
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    
}
