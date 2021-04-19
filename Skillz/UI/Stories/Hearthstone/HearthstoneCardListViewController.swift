import CellDataCoupler
import UIKit

class HearthstoneCardListViewController: BaseViewController {
    
    @IBOutlet var tableView: UITableView!
    var tableviewSource: CouplerTableSource?
    
    static func create() -> HearthstoneCardListViewController {
        let vc = UIStoryboard(name: "HearthstoneCardList", bundle: Bundle.main).instantiateViewController(identifier: "HearthstoneCardList") as! HearthstoneCardListViewController
        vc.title = "Hearthstone Cards"
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewSource()
        
    }
    
    private func setupTableViewSource() {
        tableviewSource = CouplerTableSource(with: tableView)
    }
    
}
