//
//  HeaderView.swift
//  WeatherApp
//
//  Created by Pankorn on 30/4/23.
//

import SwiftUI

struct HeaderLocationView: View {
    var countryName: String
    var date: Date
    
    func dateFormatter(_ from: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "d MMMM yyyy, EEEE"
        return formatter.string(from: from)
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 16) {
                Text(countryName)
                    .foregroundColor(Color("White"))
                    .font(.title)
                    .fontWeight(.bold)
                Text(dateFormatter(date))
                    .foregroundColor(Color("DimGray"))
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct CurrentWeatherHeaderView: View {
    @EnvironmentObject var viewModel: ForecastViewModel
    
    var body: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading) {
                Text("\(String(format: "%.1f", viewModel.weather?.current.tempC ?? 0))°")
                    .font(.system(size: 72))
                    .foregroundColor(Color("White"))
                    .fontWeight(.bold)
                Text(viewModel.weather?.current.condition.text ?? "")
                    .foregroundColor(Color("DimGray"))
                    .font(.subheadline)
                
            }
            Spacer()
            Image(systemName: "cloud.bolt.rain.fill")
                .foregroundColor(Color("White"))
                .font(.system(size: 72))
        }
        .padding(.top)
    }
}
