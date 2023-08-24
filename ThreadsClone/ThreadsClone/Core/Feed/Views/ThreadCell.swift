//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/18/23.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 12){
                CircularProfileImageView(user: thread.user, size: .Small)
                
                VStack(alignment: .leading, spacing: 4){
                    HStack{
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.bold)
                        
                        
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray))
                        
                        Button {
                            
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                        
                    }
                    Text(thread.caption)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                    
                    
                    HStack (spacing: 16){
                        
                        Button {
                            
                            
                        } label: {
                            Image(systemName: "heart")
                               
                        }
                        Button {
                            
                            
                        } label: {
                            Image(systemName: "bubble.right")
                               
                        }
                        Button {
                            
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                               
                        }
                        Button {
                            
                            
                        } label: {
                            Image(systemName: "paperplane")
                               
                        }
                        
                    }
                    .padding(.vertical, 8)
                    .foregroundColor(Color(.darkGray))
                }
            }
            Divider()
        }
        .padding()
    }
    
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(thread: dev.thread)
    }
}
