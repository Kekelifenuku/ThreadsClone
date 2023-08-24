//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/22/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading , spacing: 12){
                
                VStack(alignment: .leading , spacing: 4){
                    
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio {
                    Text(bio)
                }
                
                
                Text("10 followers")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
