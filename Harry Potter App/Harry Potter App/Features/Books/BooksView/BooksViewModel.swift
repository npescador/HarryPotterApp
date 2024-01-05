//
//  BooksViewModel.swift
//  Harry Potter App
//
//  Created by user240559 on 17/11/23.
//

import Foundation

class BooksViewModel: ObservableObject {
    
    private let booksRepository: BooksRepository
    @Published var books = [Book]()
    @Published var error: Error?
    @Published var isLoading: Bool = false
    
    init(booksRepository: BooksRepository) {
        self.booksRepository = booksRepository
    }
    
    @MainActor
    func getBooks() async {
        error = nil
        isLoading = true
        do{
            books = try await booksRepository.getBooks()
            
        } catch {
            self.error = error
        }
        
        isLoading = false
    }
}
