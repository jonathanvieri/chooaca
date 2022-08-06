//
//  WeatherView.swift
//  Chooaca
//
//  Created by Jonathan Vieri on 22/07/22.
//

import SwiftUI

/* Future TODO
 Tidy up the UI more
 Add Light / Dark mode toggle
 Add textfield to change location
 Future weather forecast
 */

struct WeatherView : View {
    
    @State private var enableDarkMode: Bool = true
    
    @StateObject var viewModel = WeatherViewModel(weatherManager: WeatherManager())
    
    var body: some View {
        
        ZStack {
            K.darkColors.backgroundColor.ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                
                // Selected location of the weather condition
                TextView(text: viewModel.cityName, size: 40)
                
                // Description of the weather condition
                TextView(text: viewModel.description, size: 30)
                
                // Symbol of the weather condition
                ImageView(conditionName: viewModel.conditionName, width: 160, height: 160)
                
                // Temperature of the weather condition
                TextView(text: "\(viewModel.temperature)°", size: 72)
                
                Spacer()
                
                // Minimum and maximum temperature of the day
                VStack() {
                    HStack(spacing: 100){
                        TextView(text: "Min: \(viewModel.minTemp)°", size: 30)
                        TextView(text: "Max: \(viewModel.maxTemp)°", size: 30)
                    }
                }
                Spacer()
            }
            .onAppear(perform: viewModel.refreshData)
            .padding()
        }
    }
}

//MARK: - Preview

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
