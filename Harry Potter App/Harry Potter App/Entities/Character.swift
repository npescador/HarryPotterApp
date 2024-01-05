//
//  Character.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation

struct Character: Codable, Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id:String
    let characterAttributes: CharacterAttribute
    
    enum CodingKeys: String, CodingKey {
        case id
        case characterAttributes = "attributes"
    }
    
    static var example: Character {
        .init(id: "f1dcffcc-94d6-4cd8-a8ea-653e52cccc9f", characterAttributes:
                .init(
                    slug: "",
                    aliasNames: [],
                    animagus: "",
                    bloodStatus: "",
                    boggart: "",
                    born: "",
                    died: "",
                    eyeColor: "",
                    familyMembers: [],
                    gender: "",
                    hairColor: "",
                    height: "",
                    house: "",
                    image: "",
                    jobs: [],
                    maritalStatus: "",
                    name: "",
                    nationality: "",
                    patronus: "",
                    romances: [],
                    skinColor: "",
                    species: "",
                    titles: [],
                    wands: [],
                    weight: "",
                    wiki: ""
                ))
    }
}

struct CharacterAttribute: Codable {
    let slug: String
    let aliasNames: [String]
    let animagus: String?
    let bloodStatus: String?
    let boggart: String?
    let born: String?
    let died: String?
    let eyeColor: String?
    let familyMembers: [String]
    let gender: String?
    let hairColor: String?
    let height: String?
    let house: String?
    let image: String?
    let jobs: [String]
    let maritalStatus: String?
    let name: String
    let nationality: String?
    let patronus: String?
    let romances: [String]
    let skinColor: String?
    let species: String?
    let titles: [String]
    let wands: [String]
    let weight: String?
    let wiki: String
    
    enum CodingKeys: String, CodingKey {
        case slug = "slug"
        case aliasNames = "alias_names"
        case animagus = "animagus"
        case bloodStatus = "blood_status"
        case boggart = "boggart"
        case born = "born"
        case died = "died"
        case eyeColor = "eye_color"
        case familyMembers = "family_members"
        case gender = "gender"
        case hairColor = "hair_color"
        case height = "height"
        case house = "house"
        case image = "image"
        case jobs = "jobs"
        case maritalStatus = "marital_status"
        case name = "name"
        case nationality = "nationality"
        case patronus = "patronus"
        case romances = "romances"
        case skinColor = "skin_color"
        case species = "species"
        case titles = "titles"
        case wands = "wands"
        case weight = "weight"
        case wiki = "wiki"
    }
}
