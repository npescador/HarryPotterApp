//
//  CharactersView.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import SwiftUI
import Combine

struct CharactersView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: CharacterViewModel
    @State var characterId: String = ""
    
    init(viewModel: CharacterViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                ScrollViewReader { proxy in
                    List{
                        ForEach(viewModel.characters, id: \.id) { character in
                            makeCharacterRow(for: character)
                                .onAppear {
                                    if character == viewModel.characters[viewModel.characters.count - 5] && viewModel.currentPage < viewModel.lastPage {
                                        characterId = character.id
                                        Task{
                                            viewModel.currentPage += 1
                                            await viewModel.getCharacters()
                                        }
                                    }
                                }
                        }
                        .listRowSpacing(8)
                        .listStyle(.plain)
                        .listRowSeparator(.hidden)
                        .onReceive(Just(viewModel.characters)) { _ in
                            withAnimation {
                                proxy.scrollTo(characterId, anchor: .bottom)
                            }
                        }
                    }
                }
            }
        }.task {
            await viewModel.getCharacters()
        }.alert("Error", isPresented: Binding.constant(viewModel.error != nil)) {
            Button("OK") {}
            Button("Retry") {
                Task {
                    await viewModel.getCharacters()
                }
            }
        } message: {
            Text(viewModel.error?.localizedDescription ?? "")
        }
    }
    
    private var nextPageView: some View {
        HStack {
            Spacer()
            VStack {
                ProgressView()
                Text("Loading next page...")
            }
            Spacer()
        }
        .onAppear(perform: {
            
        })
    }
    
    private func makeCharacterRow(for character: Character) -> some View {
        CharacterRowView(character: character)
            .background(
                NavigationLink(destination: {
                    coordinator.makeCharacterDetailView(character: character)
                }, label: { EmptyView() })
                .opacity(0.0)
            )
            
    }
}
//
//#Preview {
//    CharactersView()
//}
