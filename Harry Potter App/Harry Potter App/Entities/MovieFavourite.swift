//
//  CharacterFavourite.swift
//  Harry Potter App
//
//  Created by user240559 on 8/12/23.
//

import Foundation

struct MovieFavourite: Identifiable {
    var id:String
    var box_office: String
    var budget: String
    var cinematographers: [String]
    var directors: [String]
    var distributors: [String]
    var editors: [String]
    var music_composers: [String]
    var poster: String
    var producers: [String]
    var rating: String
    var release_date: String
    var running_time: String
    var screenwriters: [String]
    var slug: String
    var summary: String
    var title: String
    var trailer: String
    var wiki: String
    var isFavourite: Bool
    
    init(from movie: Movie) {
        self.id  = movie.id
        self.box_office =  movie.movieAttributes.box_office
        self.budget =  movie.movieAttributes.budget
        self.cinematographers =  movie.movieAttributes.cinematographers
        self.directors =  movie.movieAttributes.directors
        self.distributors =  movie.movieAttributes.distributors
        self.editors =  movie.movieAttributes.editors
        self.music_composers =  movie.movieAttributes.music_composers
        self.poster =  movie.movieAttributes.poster
        self.producers =  movie.movieAttributes.producers
        self.rating =  movie.movieAttributes.rating
        self.release_date =  movie.movieAttributes.release_date
        self.running_time =  movie.movieAttributes.running_time
        self.screenwriters =  movie.movieAttributes.screenwriters
        self.slug =  movie.movieAttributes.slug
        self.summary =  movie.movieAttributes.summary
        self.title =  movie.movieAttributes.title
        self.trailer =  movie.movieAttributes.trailer
        self.wiki =  movie.movieAttributes.wiki
        self.isFavourite = FavouritesState.isFavourite(slug: movie.movieAttributes.slug)
    }
}
