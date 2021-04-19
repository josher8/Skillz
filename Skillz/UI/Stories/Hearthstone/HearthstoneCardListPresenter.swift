protocol HearthstoneCardListView: BaseView {
    func retrieved(cards: [Card])
}

protocol HearthstoneCardListPresentation: BasePresentation {
}

class HearthstoneCardListPresenter: BasePresenter, HearthstoneCardListPresentation {
    
    private weak var view: HearthstoneCardListView?
    private var cards: [Card]?
    
    lazy var service: HearthstoneProvider = HearthstoneService()
    
    init(view: HearthstoneCardListView) {
        self.view = view
    }
    
    override func start() {
        getCards()
    }
    
    // API
    private func getCards() {
        view?.startProgress()
        
        service.getCardsBySearch(cardName:"Ysera") { (cards) in
            self.view?.stopProgress()
            self.view?.retrieved(cards: cards)
        } failure: { (message, _) in
            self.view?.stopProgress()
            self.view?.handleError("Error", message, "OK", {
            })
        }
    }
    
    
}
