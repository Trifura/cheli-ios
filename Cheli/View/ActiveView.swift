//
//  ActiveView.swift
//  Cheli
//

import SwiftUI

struct ActiveView: View {
    var myCheli : CheliPost
    @State var is_completed: Bool = false
    @StateObject var viewModel: FeedViewModel = FeedViewModel()
    @EnvironmentObject var userStore: UserStore
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text(myCheli.timeLeft)
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundColor(Color("primary500"))
                .frame(width: 116, height: 32)
                .background(.white)
                .cornerRadius(100)
            
            Text(myCheli.cheli.title)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
            
            Text(myCheli.cheli.description)
                .font(.system(size: 14))
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.top, -10)

            
            Button(action: {
                viewModel.completeCheli(challengeId: myCheli.id, userToken: userStore.userToken)
                is_completed = true
                
            }) {
                Text(is_completed || myCheli.isCompleted ? "Completed" : "Complete")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 220, height: 32)
                    .background(Color(is_completed || myCheli.isCompleted  ? "success" : "primary500"))
                    .cornerRadius(100)
            }
        }
        .frame(maxWidth: .infinity,  alignment: .leading)
    }
}

struct ActiveView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveView(myCheli: CheliPost(data: [:]))
    }
}
