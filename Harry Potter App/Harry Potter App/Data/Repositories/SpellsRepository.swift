//
//  SpellsRepository.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation


struct SpellsRepository {
    
    private let remoteService: SpellsRemoteService
    
    init(remoteService: SpellsRemoteService) {
        self.remoteService = remoteService
    }
    
    func getSpells() async throws -> [Spell] {
        return try await remoteService.getSpells()
    }
}
