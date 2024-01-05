//
//  SpellViewModel.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation

class SpellViewModel: ObservableObject {
    
    private let spellsRepository: SpellsRepository
    @Published var spells = [Spell]()
    @Published var error: Error?
    @Published var isLoading: Bool = false
    
    init(spellsRepository: SpellsRepository) {
        self.spellsRepository = spellsRepository
    }
    
    @MainActor
    func getSpells() async {
        error = nil
        isLoading = true
        do{
            spells = try await spellsRepository.getSpells()
            
        } catch {
            self.error = error
        }
        
        isLoading = false
    }
    
}
