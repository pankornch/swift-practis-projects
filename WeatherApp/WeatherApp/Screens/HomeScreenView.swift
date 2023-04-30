//
//  HomeScreenView.swift
//  WeatherApp
//
//  Created by Pankorn on 30/4/23.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        VStack {
            VStack {
                HeaderLocationView()
                
                CurrentWeatherHeaderView(degree: 18, description: "Thunderstorm")
                
                CurrentWeatherView(wind: 10, humidity: 98, rain: 100)
                
                ForcastTabsView()
                
                ForcastHourListView()
            }
            Spacer()
        }
        .padding()
        .background(Color("Dark"))
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
