//
//  PotionsRepository.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation


struct PotionsRepository {
    
    private let remoteService: PotionsRemoteService
    
    init(remoteService: PotionsRemoteService) {
        self.remoteService = remoteService
    }
    
    func getPotions() async throws -> [Potion] {
        return try await remoteService.getPotions()
    }
}
