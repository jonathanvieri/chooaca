//
//  ContentView.swift
//  Chooaca
//
//  Created by Jonathan Vieri on 16/07/22.
//

/* TODO
 Add JSON functionality
 Change weather icon accordingly
 Tidy up the UI
 Add current location (Core Location?)
 Add Light / Dark mode toggle
 Add textfield to change location
 Save location using User Defaults (Optional)
 */

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        ZStack {
            K.darkColors.backgroundColor.ignoresSafeArea(.all)
                    
            VStack {
                
                // Selected location of the weather condition
                TextView(text: "Jakarta, Indonesia", size: 40)
                Spacer()
                
                // Description of the weather condition
                TextView(text: "Cloudy", size: 40)
                
                // Symbol of the weather condition
                ImageView(conditionName: "cloud.rain", width: 160, height: 160)
                    
                
                // Temperature of the weather condition
                TextView(text: "24°", size: 72)
                TextView(text: "°", size: 60)
                
                Spacer()
                // Minimum and maximum temperature of the day
                VStack() {
                    HStack(spacing: 100){
                        TextView(text: "Min:", size: 30)
                        TextView(text: "Max:", size: 30)
                        
                    }
                }
                Spacer()
            }
        }
    }
}


//MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Due to the API limitation future weather prediction is removed
//struct WeatherView : View {
//
//    var day: String
//    var condition: String
//    var temperature: Int
//
//    var body : some View {
//        VStack {
//            Text(day)
//            Image(systemName: condition)
//            Text("\(temperature)°")
//        }
//    }
//




