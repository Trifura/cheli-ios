//
//  PeopleView.swift
//  Cheli
//
//  Created by Students on 08.05.2023..
//

import SwiftUI

struct PeopleView: View {
    var body: some View {
        HStack() {
            Text("People you may know")
            .foregroundColor(Color("grey900"))
            .font(.system(size: 24))
            .fontWeight(.bold)
            
            
        }
        .padding(.vertical, 24.0)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
