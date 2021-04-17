import UIKit

class HomeViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func navToHearthstone(_ sender: UIButton) {
        let vc = HearthstoneCardListViewController.create()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

