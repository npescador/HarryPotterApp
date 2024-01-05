//
//  Spell.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation

struct Spell: Decodable, Identifiable {
    let id:String
    let spellAttributes: SpellAttribute
    
    enum CodingKeys: String, CodingKey {
        case id
        case spellAttributes = "attributes"
    }
    
    
    static var example: Spell {
        .init(id: "f1dcffcc-94d6-4cd8-a8ea-653e52cccc9f", spellAttributes:
        .init(
            cartegory: "Charm",
            creator: "",
            effect: "Makes opponent stumble, Causes sharp pain",
            hand: "Point wand at victim",
            image: "https://static.wikia.nocookie.net/harrypotter/images/7/7f/Everte_Statum.gif",
            incantantion: "Everte Statum(ee-VER-tay STAH-tum)",
            light: "Orange",
            name: "Everte Statum",
            slug: "everte-statum",
            wiki: "https://harrypotter.fandom.com/wiki/Everte_Statum"
        )
        )
    }
    
}

struct SpellAttribute: Decodable {
    let cartegory: String?
    let creator: String?
    let effect: String?
    let hand: String?
    let image: String?
    let incantantion: String?
    let light: String?
    let name: String
    let slug: String?
    let wiki: String?
}
