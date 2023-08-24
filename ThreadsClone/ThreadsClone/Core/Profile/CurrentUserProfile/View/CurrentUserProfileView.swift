//
//  CurrentUserProfileView.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/22/23.
//

import SwiftUI
import PhotosUI
struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
   
    
    private var currentUser: User? {
        return viewModel.currentuser
    }
    var body: some View {
        NavigationStack{
        ScrollView(showsIndicators: false){
            VStack(spacing: 12) {
              
               ProfileHeaderView(user: currentUser)
                
                
                Button{
                    showEditProfile.toggle()
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(width: 352, height: 32)
                        .background(.white)
                        .cornerRadius(10)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.systemGray),lineWidth: 1)
                        }
                }
                
                //                user content list View
                
                if let user = currentUser {
                    UserContentListView(user: user)
                }
            }
            
        }
        .sheet(isPresented: $showEditProfile, content: {
            if let user = currentUser {
                
                
                EditProfileView(user: user)
            }
//                .environmentObject(viewModel)
        })
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    AuthService.shared.signOut()
                } label: {
                    Image(systemName: "power.circle.fill")
                        
                }
            }
            
        }
        .padding(.horizontal)
    }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
    }
}
