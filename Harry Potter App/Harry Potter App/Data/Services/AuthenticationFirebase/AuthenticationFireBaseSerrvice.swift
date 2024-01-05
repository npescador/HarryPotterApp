//
//  AuthenticationFireBaseSerrvice.swift
//  Harry Potter App
//
//  Created by user240559 on 13/12/23.
//

import Foundation

protocol AuthenticationFireBaseService {
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<String, Error>) -> Void)
    func getCurrentUser() -> String?
    func logout() throws 
    func login(email: String, password: String, completionBlock: @escaping (Result<String, Error>) -> Void)
}
