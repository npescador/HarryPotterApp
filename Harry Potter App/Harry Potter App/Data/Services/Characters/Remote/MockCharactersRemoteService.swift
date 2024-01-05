//
//  MockCharactersRemoteService.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation

struct MockCharactersRemoteService: CharactersRemoteService {
    func getCharacters(page: Int) async throws -> ApiResponse<Character> {
        let apiResponse: ApiResponse<Character> = .init(data: [.example,.example,.example], meta: .init(pagination: .init(current: 1, first: 1, prev: 1, next: 2, last: 10, records: 350)))
        return apiResponse
    }
}
