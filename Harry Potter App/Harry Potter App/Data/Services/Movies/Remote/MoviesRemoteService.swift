//
//  MoviesRemoteService.swift
//  Harry Potter App
//
//  Created by user240559 on 21/11/23.
//

import Foundation

protocol MoviesRemoteService {
    func getMovies() async throws -> [Movie]
}
