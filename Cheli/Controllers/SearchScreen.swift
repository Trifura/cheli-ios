import SwiftUI



struct SearchScreen: View {
    @State private var searchText = ""
    @StateObject private var userModel = UserViewModel()
    @State private var searchResults: [User] = []
    @StateObject var userStore: UserStore = UserStore()
    
    var body: some View {
        ScrollView {
            VStack {
                TitleFindView()
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                SearchBar(text: $searchText, onSearch: performSearch)
                if searchResults.isEmpty {
                    PeopleView()
                } else {
                    ForEach(searchResults, id: \.self) { user in
                        ProfileFollowersView(fullName: user.fullName, username: user.username, initials: user.initials, showSignOutButton: false)
                            .padding(.bottom, 24)
                            .onTapGesture {
                                navigateToClickedUserView(userId: user.id)
                            }
                    }
                }
            }
            .padding(.horizontal, 24)
            .onAppear {
                userModel.getMe(token: userStore.userToken)
            }
        }
    }
    
    func performSearch() {
        if searchText.isEmpty {
            searchResults = []
        } else {
            userModel.searchUsers(username: searchText) { users in
                searchResults = users
            }
        }
    }
    
    func navigateToClickedUserView(userId: String) {
        SwiftUI.NavigationLink(destination: ClickedUserView(userId: userId)) {
            EmptyView()
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
            .environmentObject(UserStore())
    }
}


struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            Image("search_tab_unselected")
            TextField("Search", text: $text, onCommit: onSearch)
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
