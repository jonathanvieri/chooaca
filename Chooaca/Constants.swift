//
//  Constants.swift
//  Chooaca
//
//  Created by Jonathan Vieri on 18/07/22.
//

import SwiftUI

struct K {
    static let api_key = "YOUR_API_KEY"
    
    struct darkColors {
        static let backgroundColor = LinearGradient(colors: [primaryColor, secondaryColor], startPoint: .topLeading, endPoint: .bottomTrailing)
        static let primaryColor = Color(red: 0.12, green: 0.11, blue: 0.21)
        static let secondaryColor = Color(red: 0.24, green: 0.2, blue: 0.31)
        static let objectColor = Color(red: 0.99, green: 0.99, blue: 0.99)
    }
    
    struct lightColors {
        static let backgroundColor = LinearGradient(colors: [primaryColor, secondaryColor], startPoint: .topLeading, endPoint: .bottomTrailing)
        static let primaryColor = Color(red: 0.57, green: 0.70, blue: 0.92)
        static let secondaryColor = Color(red: 1, green: 1, blue: 1)
        static let objectColor = Color(red: 0.24, green: 0.2, blue: 0.31)
    }
}
