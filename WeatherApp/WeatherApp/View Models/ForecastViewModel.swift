//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Pankorn on 1/5/23.
//

import Foundation

@MainActor class ForecastViewModel: ObservableObject {
    @Published var weather: Weather?
    
    func getWeatherApiKey() -> String? {
        // TODO:
        //        guard let path = Bundle.main.path(forResource: ".env", ofType: nil) else {
        //            return nil
        //        }
        return ""

    }
    
    func fetchForecastApi(form location: String) async throws -> Weather? {
        guard let apiKey = getWeatherApiKey() else { return nil }
        
        let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(location)&days=2&aqi=no&alerts=no")!
        
        let session = URLSession.shared
        
        let (data, _) = try await session.data(from: url)
        
        let decoded = try JSONDecoder().decode(Weather.self, from: data)
        
        return decoded
    }
    
    func getCurrentForecast(from: String) -> Weather {
        return self.weather!
    }
    
    func getForecastHours() -> [Int] {
        let calendar = Calendar.current
        let now = Date()
        var hours: [Int] = []
        
        for i in 0...12 {
            let nextHour = calendar.date(byAdding: .hour, value: i, to: now)!
            let h = calendar.component(.hour, from: nextHour)
            hours.append(h)
        }
        
        return hours
    }
}
