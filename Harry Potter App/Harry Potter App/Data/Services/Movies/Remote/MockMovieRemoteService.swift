//
//  MockMovieRemoteService.swift
//  Harry Potter App
//
//  Created by user240559 on 21/11/23.
//

import Foundation

struct MockMovieRemoteService: MoviesRemoteService {
    func getMovies() async throws -> [Movie] {
        return [.example, .example, .example]
    }
}
