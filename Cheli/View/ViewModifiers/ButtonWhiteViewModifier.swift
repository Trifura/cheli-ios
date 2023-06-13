

import SwiftUI

struct ButtonWhiteViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 380.0, height: 50.0)
            .background(Color("primary200"))
            .mask {
                RoundedRectangle(cornerRadius: 100)
            }
            .frame(maxWidth: .infinity)
            .font(.system(size: 16))
            .foregroundColor(Color("button2Color"))
    }
}
