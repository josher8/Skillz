import Foundation

class HearthstoneDomain {
    
    private let gateway = HearthstoneGateway()
    
    init(){}
    
    func getAllCards(success: @escaping ([Card]) -> Void, failure: @escaping (String, Error?) -> Void) {
        let endpoint = "cards/"
        gateway.request(method: .get, path: endpoint, parameters: nil) { (data, error) in
            guard let data = data else {
                failure("There was an error getting the data.", error)
                return
            }
            
            do {
                let cards = try JSONDecoder().decode([Card].self, from: data)
                success(cards)
            } catch let error {
                failure("There was an error getting the data.", error)
            }
        }
    }
    
}
