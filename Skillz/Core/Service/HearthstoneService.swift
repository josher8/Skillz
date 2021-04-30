protocol HearthstoneProvider {
    func getAllCards(success: @escaping (CardSet) -> Void, failure: @escaping (String, Error?) -> Void)
    func getCardsByClass(cardClass: String, success: @escaping ([Card]) -> Void, failure: @escaping (String, Error?) -> Void)
    func getCardsBySearch(cardName: String, success: @escaping ([Card]) -> Void, failure: @escaping (String, Error?) -> Void)
}

class HearthstoneService: HearthstoneProvider {
    
    lazy var domain = HearthstoneDomain()
    
    init() {}
    
    func getAllCards(success: @escaping (CardSet) -> Void, failure: @escaping (String, Error?) -> Void) {
        domain.getAllCards { (data) in
            success(data)
        } failure: { (message, error) in
            failure(message, error)
        }
    }
    
    func getCardsByClass(cardClass: String, success: @escaping ([Card]) -> Void, failure: @escaping (String, Error?) -> Void) {
        domain.getCardsByClass(cardClass: cardClass) { (data) in
            success(data)
        } failure: { (message, error) in
            failure(message, error)
        }
    }
    
    func getCardsBySearch(cardName: String, success: @escaping ([Card]) -> Void, failure: @escaping (String, Error?) -> Void) {
        domain.getCardsBySearch(cardName: cardName) { (data) in
            success(data)
        } failure: { (message, error) in
            failure(message, error)
        }
    }
}
