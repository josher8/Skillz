import Foundation

class HearthstoneDomain {
    
    private let gateway = HearthstoneGateway()
    
    init() {}
    
    // MARK: Get All Cards
    func getAllCards(success: @escaping (CardSet) -> Void, failure: @escaping (String, Error?) -> Void) {
        let endpoint = "cards"
        gateway.request(method: .get, path: endpoint, parameters: nil) { (data, error) in
            guard let data = data else {
                failure("There was an error getting all the cards.", error)
                return
            }
           
            do {
                let cards = try JSONDecoder().decode(CardSet.self, from: data)
                success(cards)
            } catch let error {
                failure("There was an error getting all the cards.", error)
            }
        }
    }
    
    // MARK: Get Cards By Class
    func getCardsByClass(cardClass: String, success: @escaping ([Card]) -> Void, failure: @escaping (String, Error?) -> Void) {
        let endpoint = "cards/classes/\(cardClass)"
        gateway.request(method: .get, path: endpoint, parameters: nil) { (data, error) in
            guard let data = data else {
                failure("There was an error getting \(cardClass) cards.", error)
                return
            }
            
            do {
                let cards = try JSONDecoder().decode([Card].self, from: data)
                success(cards)
            } catch let error {
                failure("There was an error getting \(cardClass) cards.", error)
            }
        }
    }
    
}
