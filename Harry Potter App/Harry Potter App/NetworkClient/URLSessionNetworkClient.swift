//
//  URLSessionNetworkClient.swift
//  Harry Potter App
//
//  Created by user240559 on 17/11/23.
//

import Foundation


class URLSessionNetworkClient: NetworkClient {
    
    func get<T>(url: String) async throws -> T where T : Decodable {
        guard let url = URL(string: url) else {
            throw NetworkClientError.badUrl
        }
        
        let data = try await URLSession.shared.data(from: url).0
        return try JSONDecoder().decode(T.self, from: data)
    }
}
