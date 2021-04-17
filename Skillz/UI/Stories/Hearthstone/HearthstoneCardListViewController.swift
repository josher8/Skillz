import UIKit

class HearthstoneCardListViewController: BaseViewController {
    
    static func create() -> HearthstoneCardListViewController {
        let vc = UIStoryboard(name: "HearthstoneCardList", bundle: Bundle.main).instantiateViewController(identifier: "HearthstoneCardList") as! HearthstoneCardListViewController
        vc.title = "Hearthstone Cards"
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
