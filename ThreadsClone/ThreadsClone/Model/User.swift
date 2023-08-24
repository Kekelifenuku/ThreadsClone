//
//  User.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/21/23.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
 
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
