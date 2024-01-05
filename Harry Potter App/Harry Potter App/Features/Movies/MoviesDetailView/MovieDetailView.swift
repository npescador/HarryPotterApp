//
//  MovieDetailView.swift
//  Harry Potter App
//
//  Created by user240559 on 21/11/23.
//

import SwiftUI
import YouTubePlayerKit

struct MovieDetailView: View {
    @StateObject var viewModel: MovieDetailViewModel
    
    let movie: MovieFavourite
    let popHandler: (() -> Void)?
    init(viewModel: MovieDetailViewModel,  movie: MovieFavourite, popHandler: (() -> Void)? = nil) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.movie = movie
        self.popHandler = popHandler
    }
   
    var body: some View {
        VStack(spacing:4){
            Text("Duration \(movie.running_time)")
            Text("Summary \(movie.summary)")
                .frame(height: 300)
                .font(.footnote)
                .padding(.horizontal, 16)
            YouTubePlayerView(YouTubePlayer(source: .url(movie.trailer)),transaction: Transaction(), placeholderOverlay: {
                ProgressView()
            })
            .frame(width:350, height: 190)
            .cornerRadius(12)
            .padding(.horizontal, 24)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        .navigationTitle(movie.title)
        .toolbar {
            Button("Favorite", systemImage: movie.isFavourite ? "star.fill" : "star") {
                Task {
                    await toggleFavoriteMovie(movie: movie)
                    popHandler?()
                }
            }
        }.task {
            await viewModel.isFavoriteMovie(movie: movie)
        }
    }
    
    private func toggleFavoriteMovie(movie: MovieFavourite) async {
        if viewModel.isFavorite {
            await viewModel.removeFavoriteMovie(movie: movie)
        } else {
            await viewModel.addFavoriteMovie(movie: movie)
        }
    }
}

//#Preview {
//    MovieDetailView(movie: .example)
//}
