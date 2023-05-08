//
//  ButtonWhiteViewModifier.swift
//  Cheli
//
//  Created by Benjamin Sabo on 28.04.2023..
//

import SwiftUI

struct HeaderTextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("headerText"))
            .font(.system(size: 32))
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .multilineTextAlignment(.center)
    }
}
