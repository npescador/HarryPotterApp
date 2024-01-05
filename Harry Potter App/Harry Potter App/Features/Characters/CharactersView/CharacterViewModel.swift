//
//  CharacterViewModel.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation



class CharacterViewModel: ObservableObject {
    public var currentPage = 1    
    public var lastPage = 3
    
    private let charactersRepository: CharactersRespository
    @Published var characters = [Character]()
    @Published var error: Error?
    @Published var isLoading: Bool = false
    
    
    init(charactersRepository: CharactersRespository) {
        self.charactersRepository = charactersRepository
    }
    
    @MainActor
    func getCharacters() async {
        error = nil
        isLoading = true
        do {
            
            let page = currentPage
            let charactersApiResponse: ApiResponse<Character> = try await charactersRepository.getCharacters(page: currentPage)
            let charactersToAdd = charactersApiResponse.data
            
            if page > 1 {
               self.characters.append(contentsOf: charactersToAdd)
            } else {
                self.characters = charactersToAdd
            }
            
            if let lastApiPage = charactersApiResponse.meta.pagination.last {
                lastPage =  lastApiPage
            } else {
                lastPage = currentPage
            }
        } catch {
            self.error = error
        }
        
        isLoading = false
    }
    
    
}
