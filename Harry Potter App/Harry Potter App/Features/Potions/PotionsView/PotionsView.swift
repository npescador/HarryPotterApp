//
//  PotionsView.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import SwiftUI

struct PotionsView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: PotionsViewModel
    
    init(viewModel: PotionsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.potions, id: \.id) { potion in
                    makePotionRow(for: potion)
                }
                .listRowSpacing(8)
                .listStyle(.plain)
                .listRowSeparator(.hidden)
            }
        }.task {
            await viewModel.getPotions()
        }.alert("Error", isPresented: Binding.constant(viewModel.error != nil)) {
            Button("OK") {}
            Button("Retry") {
                Task {
                    await viewModel.getPotions()
                }
            }
            
        } message: {
            Text(viewModel.error?.localizedDescription ?? "")
        }
    }
    
    private func makePotionRow(for potion: Potion) -> some View {
        PotionRowView(potion: potion)
            .background(
                NavigationLink(destination: {
                    coordinator.makePotionDetailView(potion: potion)
                }, label: { EmptyView() })
                .opacity(0.0)
            )
    }
}

//#Preview {
//    PotionsView()
//}
