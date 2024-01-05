//
//  SpellsView.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import SwiftUI

struct SpellsView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: SpellViewModel
    
    init(viewModel: SpellViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.spells, id: \.id) { spell in
                    makeSpellRow(for: spell)
                }
                .listRowSpacing(8)
                .listStyle(.plain)
                .listRowSeparator(.hidden)
            }
        }.task {
            await viewModel.getSpells()
        }.alert("Error", isPresented: Binding.constant(viewModel.error != nil)) {
            Button("OK") {}
            Button("Retry") {
                Task {
                    await viewModel.getSpells()
                }
            }
        } message: {
            Text(viewModel.error?.localizedDescription ?? "")
        }
    }
    
    private func makeSpellRow(for spell: Spell) -> some View {
        SpellRowView(spell: spell)
            .background(
                NavigationLink(destination: {
                    coordinator.makeSpellDetailView(spell: spell)
                }, label: { EmptyView() })
                .opacity(0.0)
            )
    }
}

//#Preview {
//    SpellsView()
//}
