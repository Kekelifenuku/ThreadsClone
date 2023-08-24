//
//  LoginVienModel.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/21/23.
//

import SwiftUI
import Firebase
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try  await AuthService.shared.login(withEmail: email, password: password)
    }
}

