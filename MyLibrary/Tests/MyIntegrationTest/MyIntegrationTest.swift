import XCTest
import MyLibrary
@testable import MyLibrary

final class MyIntegrationTest: XCTestCase {

    func testWeather()  async throws {

        let WeaServ = WeatherServiceImpl()

        let temp = try await WeaServ.getTemperature()

        XCTAssertEqual(temp, 60)
    }
}