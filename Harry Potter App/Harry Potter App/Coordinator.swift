//
//  Coordinator.swift
//  Harry Potter App
//
//  Created by user240559 on 17/11/23.
//

import Foundation

class Coordinator: ObservableObject {
    
    private let booksRepository: BooksRepository
    private let moviesRepository: MoviesRepository
    private let potionsRepository: PotionsRepository
    private let spellsRepository: SpellsRepository
    private let characterRepository: CharactersRespository
    private let notificationFeedbackRepository: UiNotificationFeedbackRepository
    private let authenticationFirebaseRepository: AuthenticationFirebaseRepository
    private let dynamicIslandService: DynamicIslandService
    
    
    init(mock: Bool = false){
        let networkClient = URLSessionNetworkClient()
        
        let bookRemoteService: BooksRemoteService = mock ? MockBooksRemoteService() : LiveBooksRemoteService(networkClient: networkClient)
        
        booksRepository = BooksRepository(remoteService: bookRemoteService)
        
        let moviesRemoteService: MoviesRemoteService = mock ? MockMovieRemoteService() : LiveMoviesRemoteService(networkClient: networkClient)
        let moviesLocalService: MoviesLocalService = UserDefaultsMoviesLocalService()
        
        moviesRepository = MoviesRepository(remoteService: moviesRemoteService, localService: moviesLocalService)
        
        let potionsRemoteService: PotionsRemoteService = mock ? MockPotionsRemoteService() : LivePotionsRemoteService(networkClient: networkClient)
        
        potionsRepository = PotionsRepository(remoteService: potionsRemoteService)
        
        let spellsRemoteService: SpellsRemoteService = mock ? MockSpellsRemoteService() : LiveSpellsRemoteService(networkClient: networkClient)
        
        spellsRepository = SpellsRepository(remoteService: spellsRemoteService)
        
        let charactersRemoteService: CharactersRemoteService = mock ? MockCharactersRemoteService() : LiveCharactersRemoteService(networkClient: networkClient)
        
        characterRepository = CharactersRespository(remoteService: charactersRemoteService)
        
        let notificationFeedbackService: UiNotificationFeedbackService = LiveUiNotificationFeedbackService()
        notificationFeedbackRepository = UiNotificationFeedbackRepository(feedbackNotificationService: notificationFeedbackService)
        
        dynamicIslandService = LiveDynamicIslandService()
        
        let authenticationFirebaseService: AuthenticationFireBaseService = LiveAuthenticationFirebaseRemoteService()
        
        authenticationFirebaseRepository = AuthenticationFirebaseRepository(auhtenticationService: authenticationFirebaseService)
    }
    
    //MARK: - EntryView
    
    func makeEntryView() -> EntryView {
        .init(viewModel: makeAuthenticationFireBaseViewModel())
    }
    
    //MARK: - Authentication Views
    
    func makeAuthenticationView() -> AuthenticationView {
        .init()
    }
    
    func makeRegisterView() -> RegisterView {
        .init()
    }
    
    func makeLoginView() -> LoginView {
        .init()
    }
        
    //MARK: - MainMenuView
    
    func makeHomeView() -> HomeView {
        .init(notificationFeedbackRepository: notificationFeedbackRepository)
    }
    
    
    //MARK: - Books Views
    func makeBooksView() -> BooksView {
        .init(viewModel: makeBooksViewModel())
    }
    
    func makeBookDetailView(book: Book) -> BookDetailView {
        .init(book: book)
    }
    
    //MARK: - Movies Views
    
    func makeMoviesView() -> MoviesView {
        .init(viewModel: makeMoviesViewModel())
    }
    
    func makeMovieDetailView(movie: MovieFavourite, popHandler: (() -> Void)? = nil) -> MovieDetailView {
        .init(viewModel: makeMovieDetailViewModel(), movie: movie, popHandler: popHandler)
    }
    
    //MARK: - Potions Views
    
    func makePotionsView() -> PotionsView {
        .init(viewModel: makePotionViewModel())
    }
    
    func makePotionDetailView(potion: Potion) -> PotionDetailView {
        .init(potion: potion)
    }
    
    //MARK: - Spells Views
    
    func makeSpellView() -> SpellsView {
        .init(viewModel: makeSpellViewModel())
    }
    
    func makeSpellDetailView(spell: Spell) -> SpellDetailView {
        .init(spell: spell)
    }
    
    //MARK: - Characters Views
    
    func makeCharactersView() -> CharactersView {
        .init(viewModel: makeCharactersViewModel())
    }
    
    func makeCharacterDetailView(character: Character) -> CharacterDetailView {
        .init(viewModel: makeCharacterDetailViewModel(), character: character)
    }
    
    
    //MARK: ViewModels
    
    private func makeBooksViewModel() -> BooksViewModel {
        .init(booksRepository: booksRepository)
    }
    
    private func makeMoviesViewModel() -> MoviesViewModel {
        .init(moviesRepository: moviesRepository)
    }
    private func makeMovieDetailViewModel() -> MovieDetailViewModel {
        .init(moviesRepository: moviesRepository)
    }
    
    private func makePotionViewModel() -> PotionsViewModel {
        .init(potionsRepository: potionsRepository)
    }
    
    private func makeSpellViewModel() -> SpellViewModel{
        .init(spellsRepository: spellsRepository)
    }
    
    private func makeCharactersViewModel() -> CharacterViewModel {
        .init(charactersRepository: characterRepository)
    }
    
    private func makeCharacterDetailViewModel() -> CharacterDetailViewModel {
        .init(dynamicIslandService: dynamicIslandService)
    }
    
    func makeAuthenticationFireBaseViewModel() -> AuthenticationViewModel {
        .init(authenticationRepository: authenticationFirebaseRepository)
    }
}

