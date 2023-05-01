//
//  HomeScreenView.swift
//  WeatherApp
//
//  Created by Pankorn on 30/4/23.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject var viewModel = ForecastViewModel()
    
    var location = "Thailand"
    
    var body: some View {
        VStack {
            VStack {
                HeaderLocationView(countryName: location, date: .now)
                
                CurrentWeatherHeaderView()
                    .environmentObject(viewModel)
                
                CurrentWeatherView()
                    .environmentObject(viewModel)
                
                ForecastTabsView()
                
                ForecastHourListView()
            }
            Spacer()
        }
        .padding()
        .background(Color("Dark"))
        .onAppear {
            Task {
                let res = try await viewModel.fetchForecastApi(form: location)
                viewModel.weather = res
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
