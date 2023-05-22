//
//  SearchScreen.swift
//  Cheli
//

import SwiftUI

struct SearchScreen: View {
    @State private var searchText = ""
    var body: some View {
        ScrollView {
            VStack() {
                TitleFindView()
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                SearchBar(text: $searchText)
                PeopleView()
             //   ForEach(0..<4) { _ in
                    ProfileFollowersView(fullName: "Ema Kurevija", username: "emica03", initials: "EK", showSignOutButton: false)
                        .padding(.bottom, 24)
                
                ProfileFollowersView(fullName: "Patricia Vujnovac", username: "pataosk", initials: "PV", showSignOutButton: false)
                    .padding(.bottom, 24)
                
                ProfileFollowersView(fullName: "Nikol Šarac", username: "nikidgo", initials: "NŠ", showSignOutButton: false)
                    .padding(.bottom, 24)
              //  }
                    //.padding(.top, 24)
            }
            .padding(.horizontal, 24)
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image("search_tab_unselected")
            TextField("Search", text: $text)
                .foregroundColor(.primary)
                .autocapitalization(.none)
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                }
                .foregroundColor(.primary)
            }
        }
        .padding(8)
        .background(Color(.systemGray5))
        .cornerRadius(8)
    }
}
