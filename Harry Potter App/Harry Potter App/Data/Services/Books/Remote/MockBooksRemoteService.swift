//
//  MockBooksRemoteService.swift
//  Harry Potter App
//
//  Created by user240559 on 17/11/23.
//

import Foundation


struct MockBooksRemoteService: BooksRemoteService {
    func getBooks() async throws -> [Book] {
        return [.example, .example, .example]
    }
}
