//
//  ContentView.swift
//  Harry Potter App
//
//  Created by user240559 on 17/11/23.
//

import SwiftUI
import YouTubePlayerKit

struct HomeView: View {
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var viewModel: AuthenticationViewModel
    private let notificationFeedbackRepository: UiNotificationFeedbackRepository
    
    init(notificationFeedbackRepository: UiNotificationFeedbackRepository) {
        self.notificationFeedbackRepository = notificationFeedbackRepository
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Harry-Potter")
                    .font(.largeTitle)
                    .bold()
                VStack(alignment: .leading){
                    Grid{
                        GridRow{
                            HStack{
                                ZStack{
                                    NavigationLink {
                                        coordinator.makeBooksView()
                                    } label: {
                                        ButtonMainMenuView(image: "books.vertical.fill", backgroundColor: .green, radius: 8, buttonTitle: "Books")
                                    }
                                    .buttonStyle(.plain)
                                }
                                ZStack{
                                    NavigationLink {
                                        coordinator.makeMoviesView()
                                    } label: {
                                        ButtonMainMenuView(image: "movieclapper", backgroundColor: .purple, radius: 8, buttonTitle: "Movies")
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .frame(height: 150)
                        }
                        GridRow{
                            HStack{
                                ZStack{
                                    NavigationLink {
                                        coordinator.makePotionsView()
                                    } label: {
                                        ButtonMainMenuView(image: "waterbottle.fill", backgroundColor: .blue, radius: 8, buttonTitle: "Potions")
                                    }
                                    .buttonStyle(.plain)
                                }
                                ZStack{
                                    NavigationLink {
                                        coordinator.makeSpellView()
                                    } label: {
                                        ButtonMainMenuView(image: "person.wave.2.fill", backgroundColor: .red, radius: 8, buttonTitle: "Spells")
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .frame(height: 150)
                        }
                        GridRow{
                            HStack{
                                ZStack{
                                    NavigationLink {
                                        coordinator.makeCharactersView()
                                    } label: {
                                        ButtonMainMenuView(image: "person.3.sequence.fill", backgroundColor: .teal, radius: 8, buttonTitle: "Characters")
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .frame(height: 150)
                        }
                    }
                }
                .padding()
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Logout") {
                    viewModel.logout()
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
