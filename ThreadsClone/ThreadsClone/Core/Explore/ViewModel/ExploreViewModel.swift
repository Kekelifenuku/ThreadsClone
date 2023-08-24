//
//  ExploreViewModel.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/22/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User ]()
    
    init() {
    Task { try await fetchUsers() }
        
    }
    @MainActor
    private func fetchUsers () async throws {
        self.users = try await UserService.fetchUsers()
    }
    
}
