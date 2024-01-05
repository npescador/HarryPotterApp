//
//  CharactersRemoteService.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation

protocol CharactersRemoteService {
    func getCharacters(page: Int) async throws -> ApiResponse<Character>
}
