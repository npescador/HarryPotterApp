//
//  CharacterDetailViewModel.swift
//  Harry Potter App
//
//  Created by user240559 on 8/12/23.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    private let moviesRepository: MoviesRepository
    
    @Published var movie: MovieFavourite?
    @Published var error: Error?
    @Published var isFavorite = false
    
    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }
    
    @MainActor
    func addFavoriteMovie(movie: MovieFavourite) async {
        error = nil
        do {
            try await moviesRepository.addFavoriteMovie(movie: movie)
            isFavorite = true
        } catch (let error) {
            self.error = error
        }
    }
    
    @MainActor
    func removeFavoriteMovie(movie: MovieFavourite) async {
        error = nil
        do {
            try await moviesRepository.removeFavoriteMovie(movie: movie)
            isFavorite = false
        } catch (let error) {
            self.error = error
        }
    }
    
    @MainActor
    func isFavoriteMovie(movie: MovieFavourite) async {
        error = nil
        
        do {
            isFavorite = try await moviesRepository.isFavoriteMovie(movie: movie)
        } catch (let error) {
            self.error = error
        }
    }
}
