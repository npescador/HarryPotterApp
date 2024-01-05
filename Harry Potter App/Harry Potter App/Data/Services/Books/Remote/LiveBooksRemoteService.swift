//
//  LiveBooksRemoteService.swift
//  Harry Potter App
//
//  Created by user240559 on 17/11/23.
//

import Foundation

struct LiveBooksRemoteService: BooksRemoteService {
    
    let networkClient: NetworkClient
    private let booksUrl: String = "https://api.potterdb.com/v1/books"
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getBooks() async throws -> [Book] {
        let response: ApiResponse<Book> = try await networkClient.get(url: booksUrl)
        return response.data
    }
}
