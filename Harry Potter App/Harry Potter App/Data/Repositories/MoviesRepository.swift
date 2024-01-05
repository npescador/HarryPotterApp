//
//  MoviesRepository.swift
//  Harry Potter App
//
//  Created by user240559 on 21/11/23.
//

import Foundation

struct MoviesRepository {
    
    private let remoteService: MoviesRemoteService
    private let localService: MoviesLocalService
    
    init(remoteService: MoviesRemoteService, localService: MoviesLocalService) {
        self.remoteService = remoteService
        self.localService = localService
    }
    
    func getMovies() async throws -> [Movie] {
        return try await remoteService.getMovies()
    }
    
    func getFavoriteMovies() async throws -> Set<String> {
        return try await localService.getFavoriteMoviesSlugs()
    }
    
    func addFavoriteMovie(movie: MovieFavourite) async throws {
        try await localService.addFavoriteMovieSlug(slug: movie.slug)
    }
    
    func removeFavoriteMovie(movie: MovieFavourite) async throws {
        try await localService.removeFavoriteMovieSlug(slug: movie.slug)
    }
    
    func isFavoriteMovie(movie: MovieFavourite) async throws -> Bool {
        return try await localService.isFavoriteMovie(slug: movie.slug)
    }
}
