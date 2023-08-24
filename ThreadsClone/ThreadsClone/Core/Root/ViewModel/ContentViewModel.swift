//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/21/23.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    public var cancellables = Set<AnyCancellable>()
    init() {
       setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
            
        }.store(in: &cancellables)
    }
}
