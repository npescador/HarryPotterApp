//
//  LiveCharactersRemoteService.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation

struct LiveCharactersRemoteService: CharactersRemoteService {
    let networkClient: NetworkClient
    private let characterUrl: String = "https://api.potterdb.com/v1/characters?page[number]="
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getCharacters(page: Int) async throws -> ApiResponse<Character> {
        let response: ApiResponse<Character> = try await networkClient.get(url: "\(characterUrl)\(page)")
        return response
    }
}
