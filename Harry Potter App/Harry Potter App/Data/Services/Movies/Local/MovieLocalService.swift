//
//  CharacterLocalService.swift
//  Harry Potter App
//
//  Created by user240559 on 8/12/23.
//

import Foundation

protocol MoviesLocalService {
    
    func getFavoriteMoviesSlugs() async throws -> Set<String>
    
    func addFavoriteMovieSlug(slug: String) async throws
    
    func removeFavoriteMovieSlug(slug: String) async throws
    
    func isFavoriteMovie(slug: String) async throws -> Bool
    
}
