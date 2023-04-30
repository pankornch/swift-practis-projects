//
//  ForcastCardView.swift
//  WeatherApp
//
//  Created by Pankorn on 30/4/23.
//

import SwiftUI

struct CurrentWeatherView: View {
    var wind: Int
    var humidity: Int
    var rain: Int
    
    var body: some View {
        HStack {
            VStack(spacing: 6) {
                Image(systemName: "wind")
                    .foregroundColor(Color("White"))
                    .font(.system(size: 32))
                Text("\(wind) m/s")
                    .foregroundColor(Color("White"))
                Text("Wind")
                    .foregroundColor(Color("DimGray"))
            }
            Spacer()
            VStack(spacing: 6) {
                Image(systemName: "humidity.fill")
                    .foregroundColor(Color("White"))
                    .font(.system(size: 32))
                Text("\(humidity)%")
                    .foregroundColor(Color("White"))
                Text("Humidity")
                    .foregroundColor(Color("DimGray"))
            }
            Spacer()
            VStack(spacing: 6) {
                Image(systemName: "umbrella.percent.fill")
                    .foregroundColor(Color("White"))
                    .font(.system(size: 32))
                Text("\(rain)%")
                    .foregroundColor(Color("White"))
                Text("Rain")
                    .foregroundColor(Color("DimGray"))
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 32)
        .background(Color("WhiteSmoke"))
        .cornerRadius(24)
    }
}


struct ForcastHourCardView: View {
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

struct ForcastTabsView: View {
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

struct ForcastHourListView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach((1...24), id: \.self) { i in
                    ForcastHourCardView(hour: i, symbol: "sun.max.fill", degree: 16)
                }
            }
        }
    }
}
