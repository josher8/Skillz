@testable import Alamofire
@testable import Skillz

class MockRestProvider: RestProvider {
    
    var requestedMethod: RestMethod?
    var requestedUrl: String?
    
    func request(url: String, method: RestMethod, parameters: [String : Any]?, headers: HTTPHeaders, completion: @escaping RestCompletion) {
        requestedMethod = method
        requestedUrl = url
    }
    
}
