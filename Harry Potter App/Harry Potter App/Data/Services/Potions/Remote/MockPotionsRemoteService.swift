//
//  MockPotionsRemoteService.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation

struct MockPotionsRemoteService: PotionsRemoteService {
    func getPotions() async throws -> [Potion] {
        return []
    }
}
