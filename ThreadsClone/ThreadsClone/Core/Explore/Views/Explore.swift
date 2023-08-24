//
//  Explore.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/17/23.
//

import SwiftUI

struct Explore: View {
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.users) { user in
                        NavigationLink(value:user) {
                            VStack(alignment: .leading, spacing: 4) {
                                UserCell(user: user)
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                Profile(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "search")
        }
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
