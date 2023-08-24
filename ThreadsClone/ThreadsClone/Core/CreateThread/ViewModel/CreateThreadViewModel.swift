//
//  CreateThreadViewModel.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/23/23.
//

import Foundation
import Firebase

class CreateThreadViewModel: ObservableObject {
   
    func uploadThread (caption: String) async throws {
    guard let uid = Auth.auth() . currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption,
        timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
}
}
