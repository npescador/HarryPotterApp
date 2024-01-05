//
//  AuthenticationFirebaseRepository.swift
//  Harry Potter App
//
//  Created by user240559 on 13/12/23.
//

import Foundation

struct AuthenticationFirebaseRepository {
    
    private let authenticationService: AuthenticationFireBaseService
    
    init(auhtenticationService: AuthenticationFireBaseService) {
        self.authenticationService = auhtenticationService
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<String, Error>) -> Void) {
        authenticationService.createNewUser(email: email, password: password, completionBlock: completionBlock)
    }
    
    func getCurrentUser() -> String? {
        authenticationService.getCurrentUser()
    }
    
    func logout() throws {
        try authenticationService.logout()
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<String, Error>) -> Void) {
        authenticationService.login(email: email, password: password, completionBlock: completionBlock)
    }
}

