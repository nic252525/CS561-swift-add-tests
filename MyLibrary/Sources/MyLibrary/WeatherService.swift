import Alamofire
import Foundation

public protocol WeatherService {
    func getTemperature() async throws -> Int
}

enum BaseUrl :String {
    case realServer = "https://api.openweathermap.org/data/2.5/weather"
    case mockServer = "http://localhost:3000/data/2.5/weather"
}

class WeatherServiceImpl: WeatherService {
    let url = "\(BaseUrl.mockServer.rawValue)?q=corvallis&units=imperial&appid=4d2aa9268f814e5ffacc718c2e5f6d2c"
    //"https://api.openweathermap.org/data/2.5/weather?q=corvallis&units=imperial&appid=4d2aa9268f814e5ffacc718c2e5f6d2c"

    func getTemperature() async throws -> Int {
        print("1")
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: Weather.self) { response in
                switch response.result {
                case let .success(weather):
                    let temperature = weather.main.temp
                    let temperatureAsInteger = Int(temperature)
                    continuation.resume(with: .success(temperatureAsInteger))

                case let .failure(error):
                    continuation.resume(with: .failure(error))
                }
            }
        }
    }
}

public struct Weather: Decodable {
    let main: Main

    struct Main: Decodable {
        let temp: Double
    }
}
