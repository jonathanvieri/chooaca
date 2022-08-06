//
//  ImageView.swift
//  Chooaca
//
//  Created by Jonathan Vieri on 21/07/22.
//

import SwiftUI

struct ImageView : View {
    var conditionName: String
    var width: CGFloat
    var height: CGFloat
    
    var body : some View {
        Image(systemName: conditionName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
            .foregroundColor(K.darkColors.objectColor)
    }
}
