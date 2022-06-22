//
//  FYWeather.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/12.
//

import SwiftUI
import WeatherKit
import CoreLocation

struct FYWeather: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func weather() async {
        let weatherService = WeatherService()
        let syracuse = CLLocation(latitude: 43, longitude: -76)
        let wether = try! await weatherService.weather(for: syracuse)
        let temperature = wether.currentWeather.temperature
        let uvIndex = wether.currentWeather.uvIndex
    }
}

struct FYWeather_Previews: PreviewProvider {
    static var previews: some View {
        FYWeather()
    }
}
