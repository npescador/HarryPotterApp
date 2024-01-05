//
//  FavouritesState.swift
//  Harry Potter App
//
//  Created by user240559 on 8/12/23.
//

import Foundation

struct FavouritesState {
    static var favourites: Set<String> = []
    
    static func toggleFavourite(slug: String) {
        if favourites.contains(slug) {
            favourites.remove(slug)
        } else {
            favourites.insert(slug)
        }
    }
    
    static func isFavourite(slug: String) -> Bool {
        return favourites.contains(slug)
    }
}
