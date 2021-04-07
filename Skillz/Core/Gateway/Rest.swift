import Alamofire

typealias RestCompletion = (_ response: Data?, _ error: Error?) -> Void

public enum RestMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol RestProvider {
    func request(url: String, method: RestMethod, parameters: [String: Any], headers: [String: String], completion: @escaping RestCompletion)
}

class Rest: RestProvider {
    
    init() {}
    
    func request(url: String, method: RestMethod, parameters: [String: Any], headers: [String: String], completion: @escaping RestCompletion) {
        AF.request(url,
                   method: HTTPMethod.init(rawValue: method.rawValue),
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: HTTPHeaders.init(headers)).response { response in
                    completion(response.data, response.error)
                   }
    }
    
}
