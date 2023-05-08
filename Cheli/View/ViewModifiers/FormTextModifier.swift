//
//  ButtonWhiteViewModifier.swift
//  Cheli
//
//  Created by Benjamin Sabo on 28.04.2023..
//

import SwiftUI

struct FormTextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("grey900"))
            .font(.system(size: 16))
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .frame(maxWidth: .infinity, alignment: .leading)

    }
}
