//
//  LiveSpellsRemoteService.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation

struct LiveSpellsRemoteService: SpellsRemoteService {
    let networkClient: NetworkClient
    private let spellsUrl: String = "https://api.potterdb.com/v1/spells"
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getSpells() async throws -> [Spell] {
        let response: ApiResponse<Spell> = try await networkClient.get(url: spellsUrl)
        return response.data
    }
}
	
