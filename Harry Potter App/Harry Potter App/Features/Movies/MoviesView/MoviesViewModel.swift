//
//  MoviesViewModel.swift
//  Harry Potter App
//
//  Created by user240559 on 21/11/23.
//

import Foundation

class MoviesViewModel: ObservableObject{
    
    private let moviesRepository: MoviesRepository
    @Published var isLoading: Bool = false
    @Published var movies = [MovieFavourite]()
    @Published var error: Error?
    
    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }
    
    @MainActor
    func getMovies() async {
        error = nil
        isLoading = true
        do {
            await getFavouritesMovies()
            let moviesResponse = try await moviesRepository.getMovies()
            movies = moviesResponse.map { movie in MovieFavourite(from: movie)}
        } catch {
            self.error = error
        }
        
        isLoading = false
    }
    
    private func getFavouritesMovies() async {
        do{
            FavouritesState.favourites = try await moviesRepository.getFavoriteMovies()
        } catch {
            self.error = error
        }
    }
}
