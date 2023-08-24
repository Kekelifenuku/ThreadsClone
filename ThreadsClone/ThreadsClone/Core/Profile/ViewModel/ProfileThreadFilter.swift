//
//  ProfileThreadFilter.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/18/23.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
   
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
       
        }
    }
    var id: Int { return self.rawValue }
}
