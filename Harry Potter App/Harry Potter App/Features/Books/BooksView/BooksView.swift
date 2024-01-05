//
//  BooksView.swift
//  Harry Potter App
//
//  Created by user240559 on 17/11/23.
//

import SwiftUI

struct BooksView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: BooksViewModel
    
    init(viewModel: BooksViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.books, id: \.id) { book in
                    makeBookRow(for: book)
                }
                .listRowSpacing(8)
                .listStyle(.plain)
                .listRowSeparator(.hidden)
            }
        }.task {
            await viewModel.getBooks()
        }.alert("Error", isPresented: Binding.constant(viewModel.error != nil)) {
            Button("OK") {}
            Button("Retry") {
                Task {
                    await viewModel.getBooks()
                }
            }
        } message: {
            Text(viewModel.error?.localizedDescription ?? "")
        }
        .navigationTitle("Books")
    }
    
    private func makeBookRow(for book: Book) -> some View {
        BookRowView(book: book)
            .background(
                NavigationLink(destination: {
                    coordinator.makeBookDetailView(book: book)
                }, label: { EmptyView() })
                .opacity(0.0)
            )
    }
}

//#Preview {
//    //BooksView()
//}
