//
//  File.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/22/23.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
static let shared = DeveloperPreview()
let user = User(id: NSUUID() . uuidString, fullname: "Max Verstappen", email: "max@gmail.com", username: "maxverstappeni")
    let thread = Thread (ownerUid: "123", caption: "This isa test thread", timestamp: Timestamp(), likes: 0)
}
