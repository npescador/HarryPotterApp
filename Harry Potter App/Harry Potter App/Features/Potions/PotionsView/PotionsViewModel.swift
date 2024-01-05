//
//  PotionsViewModel.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation

class PotionsViewModel: ObservableObject {
    
    private let potionsRepository: PotionsRepository
    @Published var potions = [Potion]()
    @Published var error: Error?
    @Published var isLoading: Bool = false
    
    init(potionsRepository: PotionsRepository) {
        self.potionsRepository = potionsRepository
    }
    
    @MainActor
    func getPotions() async {
        error = nil
        isLoading = true
        do{
            potions = try await potionsRepository.getPotions()
            
        } catch {
            self.error = error
        }
        
        isLoading = false
    }
    
}
