//
//  CharacterDetailView.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import SwiftUI

struct CharacterDetailView: View {
    @StateObject private var viewModel: CharacterDetailViewModel
    @State var activityIdentifier: String = ""
    let character: Character
    
    
    init(viewModel: CharacterDetailViewModel, character: Character) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.character = character
    }
    
    var body: some View {
        VStack {
            
            Button{
                showInDynamicIsland(character: character)
            } label: {
                Label("Show in Dynamic Island", systemImage: "person.fill.checkmark")
            }
            .buttonStyle(.borderedProminent)
            
            Button{
                Task {
                    await viewModel.endActivity()
                }
            } label: {
                Label("Stop showing", systemImage: "person.fill.xmark")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            
            if character.characterAttributes.image != nil {
                RemoteImageView(url: character.characterAttributes.image!)
            }
            
            Text("Gender \(character.characterAttributes.gender ?? "Unknown")")
            Text("Birth-year \(character.characterAttributes.born ?? "Unknown")")
            Text("House \(character.characterAttributes.house ?? "Unknown")")
        }
        .padding()
        .alert("Error", isPresented: Binding.constant(viewModel.error != nil)) {
            Button("OK") {}
        } message: {
            Text(viewModel.error?.localizedDescription ?? "")
        }
        .navigationTitle(character.characterAttributes.name)
    }
    
    
    
    func showInDynamicIsland(character: Character) {
        activityIdentifier = viewModel.startActivity(name: character.characterAttributes.name, house: character.characterAttributes.house ?? "Free", image: character.characterAttributes.image ?? "person.fill")
        
    }
}



//#Preview {
//    CharacterDetailView()
//}
