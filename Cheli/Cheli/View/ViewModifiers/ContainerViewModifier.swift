//
//  ContainerViewModifier.swift
//  Cheli
//


import SwiftUI

struct ContainerViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(Color("grey200"))
            .mask {
                RoundedRectangle(cornerRadius: 16)
            }
    }
}

