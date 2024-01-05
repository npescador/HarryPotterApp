//
//  MoviesView.swift
//  Harry Potter App
//
//  Created by user240559 on 21/11/23.
//

import SwiftUI

struct MoviesView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel: MoviesViewModel
    
    init(viewModel: MoviesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    @State var showFavorites = false
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                
                Toggle(isOn: $showFavorites) {
                    Text("ShowFavourites")
                }
                .padding(.horizontal, 16)
                
                List {
                    ForEach(viewModel.movies, id: \.id) { movie in
                        if !self.showFavorites || movie.isFavourite {
                            makeMoviewRow(for: movie)
                        }
                    }
                    .listRowSpacing(8)
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
                }
                
            }
        }.task {
            await viewModel.getMovies()
        }.alert("Error", isPresented: Binding.constant(viewModel.error != nil)) {
            Button("OK") {}
            Button("Retry") {
                Task {
                    await viewModel.getMovies()
                }
            }
        } message: {
            Text(viewModel.error?.localizedDescription ?? "")
        }
        .navigationTitle("Movies")
    }
    
    private func makeMoviewRow(for movie: MovieFavourite) -> some View {
        MoviewRowView(movie: movie)
            .background(
                NavigationLink(destination: {
                    coordinator.makeMovieDetailView(movie: movie, popHandler: {
                        Task {
                            await viewModel.getMovies()
                        }
                    })
                }, label: { EmptyView() })
                .opacity(0.0)
            )
    }
}
    
    //#Preview {
    //    MoviesView()
    //}
