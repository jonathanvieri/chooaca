//
//  TextView.swift
//  Chooaca
//
//  Created by Jonathan Vieri on 21/07/22.
//

import SwiftUI

struct TextView : View {
    
    var text: String
    var size: CGFloat
    
    var body : some View {
        Text(text)
            .font(.system(size: size))
            .fontWeight(.bold)
            .foregroundColor(K.darkColors.objectColor)
    }
}
