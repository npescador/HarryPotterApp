//
//  UserDefaultsCharacterLocalService.swift
//  Harry Potter App
//
//  Created by user240559 on 8/12/23.
//

import Foundation


struct UserDefaultsMoviesLocalService: MoviesLocalService {
    private let favoriteSlugsKey = "favorites_slugs"
    
    func getFavoriteMoviesSlugs() async throws -> Set<String> {
        guard let data = UserDefaults.standard.data(forKey: favoriteSlugsKey) else {
            return []
        }
        
        return try JSONDecoder().decode(Set<String>.self, from: data)
    }
    
    func addFavoriteMovieSlug(slug: String) async throws {
        var moviesSlugs = try await getFavoriteMoviesSlugs()
        if !moviesSlugs.contains(slug) {
            moviesSlugs.insert(slug)
        }
        try await saveFavoriteMoviesSlugs(moviesSlugs: moviesSlugs)
    }
    
    func removeFavoriteMovieSlug(slug: String) async throws {
        var moviesSlugs = try await getFavoriteMoviesSlugs()
        moviesSlugs.remove(slug)
        try await saveFavoriteMoviesSlugs(moviesSlugs: moviesSlugs)
    }
    
    func isFavoriteMovie(slug: String) async throws -> Bool {
        let moviesSlugs = try await getFavoriteMoviesSlugs()
        
        return moviesSlugs.contains { movieSlug in
            movieSlug == slug
        }
    }
    
    private func saveFavoriteMoviesSlugs(moviesSlugs: Set<String>) async throws {
        let data = try JSONEncoder().encode(moviesSlugs)
        UserDefaults.standard.set(data, forKey: favoriteSlugsKey)
    }
}
