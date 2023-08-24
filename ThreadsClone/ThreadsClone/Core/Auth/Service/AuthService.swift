//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/20/23.
//


import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    
   @Published var userSession: FirebaseAuth.User?
  static let shared = AuthService()
   init() {

      self.userSession = Auth.auth().currentUser
//        loadCurrentUserData()
//        print("DEBUG: User session id is \(userSession?.uid  )")
  }

    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
//           loadCurrentUserData()
        } catch {
            print ("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do{
            
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
//            loadCurrentUserData()
            print("DEBUG: Create user\(result.user.uid)")
        } catch {
            print ("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
   func signOut() {
        
            try? Auth.auth().signOut()
            self.userSession = nil
       UserService.shared.reset()
    }

    private func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String
    ) async throws {
let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
        UserService.shared.currentUser = user
    }

}


    

