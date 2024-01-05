//
//  CharactersRespository.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation


struct CharactersRespository {
    
    private let remoteService: CharactersRemoteService
    
    init(remoteService: CharactersRemoteService) {
        self.remoteService = remoteService
    }
    
    func getCharacters(page: Int) async throws -> ApiResponse<Character> {
        return try await remoteService.getCharacters(page: page)
    }
}
