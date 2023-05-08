//
//  ButtonWhiteViewModifier.swift
//  Cheli
//
//  Created by Benjamin Sabo on 28.04.2023..
//

import SwiftUI

struct ButtonWhiteViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 380.0, height: 50.0)
            .background(Color("primary200"))
            .frame(maxWidth: .infinity)
            .font(.system(size: 16))
            .mask {
                RoundedRectangle(cornerRadius: 100)
            }
            .foregroundColor(Color("button2Color"))
    }
}
