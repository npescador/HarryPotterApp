//
//  BooksRepository.swift
//  Harry Potter App
//
//  Created by user240559 on 17/11/23.
//

import Foundation

struct BooksRepository {
    
    private let remoteService: BooksRemoteService
    
    init(remoteService: BooksRemoteService) {
        self.remoteService = remoteService
    }
    
    func getBooks() async throws -> [Book] {
        return try await remoteService.getBooks()
    }
}
