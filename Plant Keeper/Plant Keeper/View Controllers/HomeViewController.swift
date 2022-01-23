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
        backgroundImage.image = UIImage(named: "back2")
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
                let number = firstnames.count
                for (val, element) in firstnames.enumerated() {
                    let element = firstnames[val]
                    let element1 = element as! String
                    self.data.append(Item(image: UIImage(named: "back")!, rating: nil, title: element1, subtitle: "subtitle", description: "this is a description"))
                }
                print("names: \(firstnames)")
                print("names: \(countries)")
                

                

                

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
