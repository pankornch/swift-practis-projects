//
//  HeaderView.swift
//  WeatherApp
//
//  Created by Pankorn on 30/4/23.
//

import SwiftUI

struct HeaderLocationView: View {
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 16) {
                Text("Thailand")
                    .foregroundColor(Color("White"))
                    .font(.title)
                Text("1 Jan 2023, Sunday")
                    .foregroundColor(Color("DimGray"))
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct CurrentWeatherHeaderView: View {
    var degree: Int
    var description: String
    
    var body: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading) {
                Text("\(degree)°")
                    .font(.system(size: 72))
                    .foregroundColor(Color("White"))
                    .fontWeight(.bold)
                Text(description)
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
