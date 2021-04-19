import UIKit

class HomeViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.getCardsbyClass(cardClass: "Mage") { (data) in
            print(data.count)
        } failure: { (message, _) in
            print(message)
        }
    }

    @IBAction func navToHearthstone(_ sender: UIButton) {
        let vc = HearthstoneCardListViewController.create()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

