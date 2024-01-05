//
//  Potion.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation

struct Potion: Decodable, Identifiable {
    let id: String
    let attributes: PotionAttribute

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case attributes = "attributes"
    }
    
    
//    static var example: Potion {
//        .init(id: "f1dcffcc-94d6-4cd8-a8ea-653e52cccc9f", attributes: ["", ""]()
//        )
//    }
}

struct PotionAttribute: Decodable {
    let characteristics:String?    //Las características de esta poción.    ✅
    let difficulty:String?    //La dificultad para preparar esta poción.    ✅
    let effect:String?    //El efecto principal de esta poción.    ✅
    let image:String?    //Un enlace a una imagen de esta poción.    ❌
    let inventors:String?    //Los inventores de esta poción.    ✅
    let ingredients:String?    //Los ingredientes necesarios para preparar esta poción.    ✅
    let manufacturers:String?    //Los fabricantes de esta poción.    ✅
    let name:String?    //El nombre de esta poción.    ✅
    let side_effects:String?    //Los efectos secundarios de esta poción.    ✅
    let slug:String?    //Un slug para identificar esta poción.    ❌
    let time:String?    //El tiempo que lleva preparar esta poción.    ✅
    let wiki:String?    //Un enlace a la página Wiki de Harry Potter de esta poción.
    
}
