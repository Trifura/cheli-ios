//
//  CheliView.swift
//  Cheli
//
//  Created by Temp Guest on 02.05.2023..
//

import SwiftUI

struct CheliView: View {
    var body: some View {
        HStack() {
            Text("45 Cheli")
            .foregroundColor(Color("grey900"))
            .font(.system(size: 24))
            .fontWeight(.bold)
        
        }
        .padding(.vertical, 24.0)
        .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

struct CheliView_Previews: PreviewProvider {
    static var previews: some View {
        CheliView()
    }
}
