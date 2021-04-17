struct CardSet: Codable {
    var Classic: [Card]?
    var HallOfFame: [Card]?
    
    private enum CodingKeys : String, CodingKey {
        case HallOfFame = "Hall of Fame"
    }
}
