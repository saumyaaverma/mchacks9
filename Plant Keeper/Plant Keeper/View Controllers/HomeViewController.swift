import UIKit
import Firebase
import FirebaseFirestore
import CardSlider

struct Item:  CardSliderItem {
    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
    var description: String?
}

class HomeViewController: UIViewController, CardSliderDataSource {
    
    @IBOutlet weak var findKeeperButton: UIButton!
    
    

    var data = [Item]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "back7")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        

        

        guard let dataSource = self as? CardSliderDataSource else {
            return
        }
        

        

        let db = Firestore.firestore()
        db.collection("users").whereField("isAvailable", isEqualTo: true)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                
                let firstnames = documents.map { $0["firstname"]! }
                let countries = documents.map { $0["country"]! }
                let cities = documents.map { $0["city"]! }
                let postalCodes = documents.map { $0["postalCode"]! }
                let emails = documents.map { $0["email"]! }
                let costs = documents.map { $0["cost"]! }
                
                for (val, _) in firstnames.enumerated() {
                    let name = firstnames[val] as! String
                    let country = countries[val] as! String
                    let city = cities[val] as! String
                    let postalCode = postalCodes[val] as! String
                    let email = emails[val] as! String
                    let cost = costs[val] as! String
                    
                    let numString = "\(val + 2)"
                    let string = "back" + numString
                    
                    
                    self.data.append(Item(image: UIImage(named: string)!, rating: nil, title: name,
                                          subtitle: country + ", " + city + " " + postalCode, description: "Contact Information:  \n" + email + "\n \n" +
                                          "\nPrice per plant per day:  \n" + "$" + cost))

                }

                

            }

    }
    

    func item(for index: Int) -> CardSliderItem {
        return data[index]
    }
    

    func numberOfItems() -> Int {
        return data.count
    }
    
    
    @IBAction func findKeeperButtonTapped(_ sender: Any) {
        let vc = CardSliderViewController.with(dataSource: self)
        vc.title = "Plant Keepers"
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}
