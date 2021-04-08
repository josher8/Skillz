protocol HearthstoneProvider {
    func getAllCards(success: @escaping ([Card]) -> Void, failure: @escaping (String, Error?) -> Void)
}

class HearthstoneService: HearthstoneProvider {
    
    lazy var domain = HearthstoneDomain()
    
    func getAllCards(success: @escaping ([Card]) -> Void, failure: @escaping (String, Error?) -> Void) {
        domain.getAllCards { (data) in
            success(data)
        } failure: { (message, error) in
            failure(message, error)
        }
    }
}
