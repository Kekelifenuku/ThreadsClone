//
//  CreateThreadview.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/17/23.
//

import SwiftUI

struct CreateThreadview: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                
                HStack(alignment: .top){
                    CircularProfileImageView(user: user, size: .small)
                    
                    
                    VStack(alignment: .leading, spacing: 4){
                        
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread...", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    
                    if !caption.isEmpty {
                        
                        Button{
                        caption = ""
                            
                        }  label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 12, height: 12)
                            
                        }
                    }
                }
                Spacer()
            
                
            }
            .padding()
            .navigationTitle("New Threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.black)
                    .font(.subheadline)
                }
                
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Post") {
                        Task { try await viewModel.uploadThread(caption: caption)}
                        dismiss()
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.subheadline)
                }
            }
        }
    }
}

struct CreateThreadview_Previews: PreviewProvider {
    static var previews: some View {
        CreateThreadview()
    }
}
