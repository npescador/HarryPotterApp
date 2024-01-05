//
//  SpellsRemoteService.swift
//  Harry Potter App
//
//  Created by user240559 on 25/11/23.
//

import Foundation

protocol SpellsRemoteService {
    func getSpells() async throws -> [Spell]
}
