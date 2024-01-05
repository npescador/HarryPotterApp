//
//  CharacterDetailViewModel.swift
//  Harry Potter App
//
//  Created by user240559 on 2/1/24.
//

import Foundation

class CharacterDetailViewModel: ObservableObject {
    
    private let dynamicIslandService: DynamicIslandService
    
    @Published var error: Error?
    
    init(dynamicIslandService: DynamicIslandService) {
        self.dynamicIslandService = dynamicIslandService
    }
    
    @MainActor
    func startActivity(name: String, house: String, image: String) -> String {
        error = nil
        var identifier: String = ""
        do {
            identifier = try dynamicIslandService.startActivity(name: name, house: house, image: image)
        } catch {
            self.error = error
        }
        
        return identifier
    }
    
    func endActivity() async {
        await dynamicIslandService.endActivity()
    }
}

