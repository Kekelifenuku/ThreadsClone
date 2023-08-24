//
//  SwiftUIView.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/17/23.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                        
                    }
                }
            }
                .refreshable {
                    Task { try await viewModel.fetchThreads () }
                
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
            Button{}
            label: {
                Image(systemName: "arrow.counterclockwise")
                    .foregroundColor(.black)
            }
          }
       }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            FeedView()
        }
    }
}
