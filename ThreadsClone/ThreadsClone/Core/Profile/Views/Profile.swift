//
//  Profile.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/17/23.
//

import SwiftUI

struct Profile: View {
    let user: User
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return  UIScreen.main.bounds.width / count - 16
    }
    
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            VStack(spacing: 12) {
                ProfileHeaderView(user: user)
                
                Button{
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(10)
                }
                
                //                user content list View
                UserContentListView(user: user)
             
                
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
       
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(user: dev.user)
    }
}
