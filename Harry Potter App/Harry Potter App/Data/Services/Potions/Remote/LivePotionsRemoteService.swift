//
//  LivePotionsRemoteService.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation

struct LivePotionsRemoteService: PotionsRemoteService {
    
    let networkClient: NetworkClient
    private let potionsUrl: String = "https://api.potterdb.com/v1/potions"
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getPotions() async throws -> [Potion] {
        let response: ApiResponse<Potion> = try await networkClient.get(url: potionsUrl)
        return response.data
    }
}
