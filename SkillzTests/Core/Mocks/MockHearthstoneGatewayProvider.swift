@testable import Alamofire
@testable import Skillz

class MockHearthstoneGatewayProvider: HearthstoneGatewayProvider {

    var requestedMethod: RestMethod?
    var requestedEndpoint: String?

    func request(method: RestMethod, path: String, parameters: [String : Any]?, completion: @escaping RestCompletion) {
        requestedMethod = method
        requestedEndpoint = path
    }
    
}
