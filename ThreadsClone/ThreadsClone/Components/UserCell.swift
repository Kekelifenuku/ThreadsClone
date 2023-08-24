//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/18/23.
//

import SwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        HStack{
            CircularProfileImageView(user: user, size: .small)
            
            VStack(alignment: .leading){
                
                Text(user.username)
                
                    .fontWeight(.bold)
                
                Text(user.fullname )
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.bold)
                .frame(width: 100, height: 32)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                }
        }
        .padding(.horizontal)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: dev.user)
    }
}
