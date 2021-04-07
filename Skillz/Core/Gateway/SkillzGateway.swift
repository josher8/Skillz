enum SkillzEndpoints: String {
    case production = "https://omgvamp-hearthstone-v1.p.rapidapi.com/"
}

protocol SkillzGatewayProvider {
    func request(method: RestMethod, path: String, parameters: [String: Any], completion: @escaping RestCompletion)
}

class SkillzGateway: SkillzGatewayProvider {
    
    private let rest: RestProvider
    private let headers = [String: String]()
    
    init(rest: RestProvider = Rest()) {
        self.rest = rest
    }
    
    func request(method: RestMethod, path: String, parameters: [String : Any], completion: @escaping RestCompletion) {
        let url = "\(SkillzEndpoints.production)/\(path))"
        rest.request(url: url, method: method, parameters: parameters, headers: headers, completion: completion)
    }

}
