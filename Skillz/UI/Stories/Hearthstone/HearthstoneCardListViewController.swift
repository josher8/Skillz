import CellDataCoupler
import UIKit

class HearthstoneCardListViewController: BaseViewController {
    
    @IBOutlet var tableView: UITableView!
    var tableViewSource: CouplerTableSource?
    
    private var presenter: HearthstoneCardListPresentation!
    
    static func create() -> HearthstoneCardListViewController {
        let vc = UIStoryboard(name: "HearthstoneCardList", bundle: Bundle.main).instantiateViewController(identifier: "HearthstoneCardList") as! HearthstoneCardListViewController
        vc.presenter = HearthstoneCardListPresenter(view: vc)
        vc.title = "Hearthstone Cards"
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewSource()
        presenter.start()        
    }
    
    private func setupTableViewSource() {
        tableViewSource = CouplerTableSource(with: tableView)
    }
    
}

extension HearthstoneCardListViewController: HearthstoneCardListView {
    
    func retrieved(cards: [Card]) {
        let sections = cards.map { self.section(for: $0) }
        tableViewSource?.set(sections: sections)
    }
    
    func section(for card: Card) -> CellCouplerSection {
        var couplers = [BaseCellCoupler]()
        
        let hearthstoneCardData = HearthstoneCardData(name: card.name ?? "", img: card.img ?? "")
        let hearthstoneCardCell = CellCoupler(HearthstoneCardCell.self, hearthstoneCardData)
        couplers.append(hearthstoneCardCell)
        
        return CellCouplerSection(header: nil, footer: nil, couplers: couplers)
    }
    
}
