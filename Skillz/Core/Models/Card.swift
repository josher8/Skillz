struct Card: Decodable   {
    var cardId: String?
    var dbfId: String?
    var name: String?
    var cardSet: String?
    var type: String?
    var text: String?
    var playerClass: String?
    
    private enum RootKeys: String, CodingKey {
        case cardId
        case dbfId
        case name
        case cardSet
        case type
        case text
        case playerClass
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        self.cardId = try container.decode(String.self, forKey: .cardId)
        self.dbfId = try container.decode(String.self, forKey: .dbfId)
        self.name = try container.decode(String.self, forKey: .name)
        self.cardSet = try container.decode(String.self, forKey: .cardSet)
        self.type = try container.decode(String.self, forKey: .type)
        self.text = try container.decode(String.self, forKey: .text)
        self.playerClass = try container.decode(String.self, forKey: .playerClass)
    }
}
