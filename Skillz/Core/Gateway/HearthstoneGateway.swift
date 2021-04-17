import Alamofire

enum HearthstoneEndpoints: String {
    case production = "https://omgvamp-hearthstone-v1.p.rapidapi.com/"
}

protocol HearthstoneGatewayProvider {
    func request(method: RestMethod, path: String, parameters: [String: Any]?, completion: @escaping RestCompletion)
}

class HearthstoneGateway: HearthstoneGatewayProvider {
    
    private let rest: RestProvider
    private var headers = HTTPHeaders()
    
    init(rest: RestProvider = Rest()) {
        self.rest = rest
        setHeaders()
    }
    
    func request(method: RestMethod, path: String, parameters: [String : Any]?, completion: @escaping RestCompletion) {
        let url = "\(HearthstoneEndpoints.production.rawValue)\(path)"
        rest.request(url: url, method: method, parameters: parameters, headers: headers, completion: completion)
    }
    
    private func setHeaders() {
        headers = [
            "x-rapidapi-key": "ecde325decmsh846cba986e897aap13f97fjsnc9148e9d2793",
            "x-rapidapi-host": "omgvamp-hearthstone-v1.p.rapidapi.com"
        ]
    }

}
