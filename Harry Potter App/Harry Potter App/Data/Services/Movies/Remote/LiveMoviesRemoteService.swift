//
//  LiveMoviesRemoteService.swift
//  Harry Potter App
//
//  Created by user240559 on 21/11/23.
//

import Foundation

struct LiveMoviesRemoteService: MoviesRemoteService {
        
    let networkClient: NetworkClient
    private let moviesUrl: String = "https://api.potterdb.com/v1/movies"
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getMovies() async throws -> [Movie] {
        let response: ApiResponse<Movie> = try await networkClient.get(url: moviesUrl)
        return response.data
    }
}
