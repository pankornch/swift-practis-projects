//
//  ForcastCardView.swift
//  WeatherApp
//
//  Created by Pankorn on 30/4/23.
//

import SwiftUI

struct CurrentWeatherView: View {
    @EnvironmentObject var viewModel: ForecastViewModel
    
    var body: some View {
        HStack {
            VStack(spacing: 6) {
                Image(systemName: "wind")
                    .foregroundColor(Color("White"))
                    .font(.system(size: 32))
                Text("\(String(format: "%.1f", viewModel.weather?.current.windKph ?? 0)) m/s")
                    .foregroundColor(Color("White"))
                Text("Wind")
                    .foregroundColor(Color("DimGray"))
            }
            Spacer()
            VStack(spacing: 6) {
                Image(systemName: "humidity.fill")
                    .foregroundColor(Color("White"))
                    .font(.system(size: 32))
                Text("\(viewModel.weather?.current.humidity ?? 0)%")
                    .foregroundColor(Color("White"))
                Text("Humidity")
                    .foregroundColor(Color("DimGray"))
            }
            Spacer()
            VStack(spacing: 6) {
                Image(systemName: "cloud.fill")
                    .foregroundColor(Color("White"))
                    .font(.system(size: 32))
                Text("\(viewModel.weather?.current.cloud ?? 0)%")
                    .foregroundColor(Color("White"))
                Text("Cloud")
                    .foregroundColor(Color("DimGray"))
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 32)
        .background(Color("WhiteSmoke"))
        .cornerRadius(24)
    }
}


struct ForecastHourCardView: View {
    var hour: Int
    var symbol: String
    var degree: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text("\(hour)")
                .foregroundColor(Color("White"))
            Image(systemName: symbol)
                .foregroundColor(Color("White"))
                .font(.system(size: 32))
            Text("\(degree)°")
                .foregroundColor(Color("White"))
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 24)
        .background(Color("WhiteSmoke"))
        .cornerRadius(16)
    }
}

struct ForecastTabsView: View {
    var body: some View {
        HStack {
            Text("Today")
                .foregroundColor(Color("White"))
                .fontWeight(.bold)
                .padding(.bottom, 5)
                .overlay(
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color("White")),
                    alignment: .bottom
                )
            
            Text("Tomorrow")
                .foregroundColor(Color("White"))
                .padding(.bottom, 5)
            Text("Next 10 days")
                .foregroundColor(Color("White"))
                .padding(.bottom, 5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical)
    }
}

struct ForecastHourListView: View {
    @StateObject var viewModel = ForecastViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(viewModel.getForecastHours(), id: \.self) { i in
                    ForecastHourCardView(hour: i, symbol: "sun.max.fill", degree: 16)
                }
            }
        }
    }
}
