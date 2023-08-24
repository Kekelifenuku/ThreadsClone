//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/21/23.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentuser: User?
    
 private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentuser = user
           
        }.store(in: &cancellables)
    }
    
    

}
