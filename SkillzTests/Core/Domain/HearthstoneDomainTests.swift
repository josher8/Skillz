@testable import Skillz
import XCTest

class HearthstoneDomainTests: XCTestCase {
    
    var mockRestProvider: MockHearthstoneGatewayProvider!
    var hearthstoneDomainUT: HearthstoneDomain!
    
    override func setUp() {
        mockRestProvider = MockHearthstoneGatewayProvider()
        hearthstoneDomainUT = HearthstoneDomain(gateway: mockRestProvider)
    }
    
    override func tearDown() {
        hearthstoneDomainUT = nil
        mockRestProvider = nil
    }
    
    func testHearthstoneDomainGetAllCardsRequestsetAllCardsEndpoint() {
        hearthstoneDomainUT.getAllCards(success: { _ in }, failure: { _, _ in })
        
        XCTAssertEqual(mockRestProvider.requestedMethod, .get)
        XCTAssertEqual(mockRestProvider.requestedEndpoint, "cards")
    }
    
    func testHearthstoneDomainGetCardsByClassRequestsGetCardsByClassEndpoint() {
        let cardClass = "Mage"
        hearthstoneDomainUT.getCardsByClass(cardClass: cardClass, success: { _ in }, failure: { _, _ in })
        
        XCTAssertEqual(mockRestProvider.requestedMethod, .get)
        XCTAssertEqual(mockRestProvider.requestedEndpoint, "cards/classes/\(cardClass)")
    }
    
    func testHearthstoneDomainGetCardsBySearchRequestsGetCardsBySearchEndpoint() {
        let cardName = "Ysera"
        hearthstoneDomainUT.getCardsBySearch(cardName: cardName, success: { _ in }, failure: { _, _ in })
        
        XCTAssertEqual(mockRestProvider.requestedMethod, .get)
        XCTAssertEqual(mockRestProvider.requestedEndpoint, "cards/\(cardName)")
    }
    
}
