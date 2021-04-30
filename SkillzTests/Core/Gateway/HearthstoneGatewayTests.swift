@testable import Alamofire
@testable import Skillz
import XCTest

class HearthstoneGatewayTests: XCTestCase {
    
    var mockRestProvider: MockRestProvider!
    var mockHearthstoneGateway: MockHearthstoneGatewayProvider!
    var hearthstoneGatewayUT: HearthstoneGateway!
    
    override func setUp() {
        mockRestProvider = MockRestProvider()
        mockHearthstoneGateway = MockHearthstoneGatewayProvider()
        hearthstoneGatewayUT = HearthstoneGateway(rest: mockRestProvider)
    }
    
    override func tearDown() {
        mockHearthstoneGateway = nil
        mockRestProvider = nil
    }
    
    func testRequestWithUrl() {
        let url = "url"
        let base = HearthstoneEndpoints.production.rawValue
        hearthstoneGatewayUT.request(method: .get, path: url, parameters: nil, completion: { _, _ in })
        
        XCTAssertEqual(mockRestProvider.requestedMethod, .get)
        XCTAssertEqual(mockRestProvider.requestedUrl, base + url)
        XCTAssertNil(mockRestProvider.requestedParameters)
    }
    
    func testRequestWithParameters() {
        let value1: String? = "test"
        let value2: Int? = 1
        let value3: Int? = nil
        let parameters: [String: Any] = ["test1": value1, "test2": value2, "test3": value3]
        hearthstoneGatewayUT.request(method: .get, path: "", parameters: parameters, completion: { _, _ in })
        
        XCTAssertEqual(mockRestProvider.requestedMethod, .get)
        XCTAssertEqual(mockRestProvider.requestedParameters?["test1"] as? String, value1)
        XCTAssertEqual(mockRestProvider.requestedParameters?["test2"] as? Int, value2)
        XCTAssertEqual(mockRestProvider.requestedParameters?["test3"] as? Int, value3)
    }
    
}
