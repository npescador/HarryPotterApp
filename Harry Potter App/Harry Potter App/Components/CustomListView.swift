//
//  CustomListView.swift
//  Harry Potter App
//
//  Created by user240559 on 21/11/23.
//

import SwiftUI

struct CustomListView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.books, id: \.slug) { book in
                    NavigationLink {
                        coordinator.makeBookDetailView(book: book)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.headline)
                            
                            Text(book.author)
                        }
                    }
                }
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
    }
}

#Preview {
    CustomListView()
}
