//
//  AuthenticationViewModel.swift
//  Harry Potter App
//
//  Created by user240559 on 13/12/23.
//

import Foundation

class AuthenticationViewModel: ObservableObject {
    
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    private let authenticationRepository: AuthenticationFirebaseRepository
    @Published var registerEmail: String?
    @Published var errorMessage: String?
    @Published var state: SignInState = .signedOut
    
    init(authenticationRepository: AuthenticationFirebaseRepository) {
        self.authenticationRepository = authenticationRepository
        getCurrentUser()
    }
    
    func createNewUser(email: String, password: String) {
        authenticationRepository.createNewUser(email: email, password: password) { [weak self] result in
            switch result {
                
            case .success(let email):
                self?.registerEmail = email
                self?.state = .signedIn
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }
    
    func getCurrentUser() {
        self.registerEmail = authenticationRepository.getCurrentUser()
    }
    
    func logout() {
        do {
            try authenticationRepository.logout()
            self.registerEmail = nil
            self.state = .signedOut
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    func login(email: String, password: String) {
        authenticationRepository.login(email: email, password: password) { [weak self] result in
            switch result {
                
            case .success(let email):
                self?.registerEmail = email
                self?.state = .signedIn
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }
}

