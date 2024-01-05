//
//  LiveAuthenticationFirebaseRemoteService.swift
//  Harry Potter App
//
//  Created by user240559 on 13/12/23.
//

import Foundation
import FirebaseAuth

struct LiveAuthenticationFirebaseRemoteService: AuthenticationFireBaseService {
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                completionBlock(.failure(error))
                return
            }
            
            let email = authDataResult?.user.email ?? "No email"
            completionBlock(.success(email))
        }
    }
    
    func getCurrentUser() -> String? {
        guard let email = Auth.auth().currentUser?.email else {
            return nil
        }
        
        return email
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                completionBlock(.failure(error))
                return
            }
            
            let email = authDataResult?.user.email ?? "No email"
            completionBlock(.success(email))
        }
    }
}
